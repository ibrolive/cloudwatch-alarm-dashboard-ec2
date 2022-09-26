
provider "aws" {
  region  = var.region
}

locals {
  common_tags = {
    Owner_Name       = "cloud-watch-demo"
    Line_of_Business = "cloud-watch-demo"
    Application_Name = "cloud-watch-demo"
    Enviroment_Name  = "cloud-watch-demo"
  }
}

data "template_file" "cloudwatch_dashboard" {
  template = file("${path.module}/templates/dashboard.tpl")

  vars = {
    region = var.region
  }
}


resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "demo-cloudwatch-main-dashboard"
  dashboard_body = data.template_file.cloudwatch_dashboard.rendered
}

resource "aws_sns_topic" "cloud_watch_alarm_topic" {
  count        = length(var.alarm_type)
  name         = "cloud-watch-${var.alarm_type[count.index]}-alarm-topic"
  display_name = "CW Alarm | ${var.alarm_type[count.index]} | demo"
  tags         = local.common_tags
}

resource "aws_sns_topic_subscription" "cloud_watch_alarm_email_target" {
  count     = length(var.alarm_type)
  topic_arn = aws_sns_topic.cloud_watch_alarm_topic[count.index].arn
  protocol  = "email"
  endpoint  = "AWS-CloudWatch-XXXXXXXX@XXXXXXX.com"
} 

resource "aws_cloudwatch_metric_alarm" "cw_alarm" {
  count                     = length(var.alarm_type)
  alarm_name                = "${var.alarm_type[count.index]}-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = var.metric_name[count.index] 
  namespace                 = var.name_space[count.index]
  period                    = var.period[count.index]
  statistic                 = var.statistic[count.index]
  threshold                 = var.threshold[count.index]
  alarm_description         = "This metric monitors ${var.alarm_type[count.index]}"
  insufficient_data_actions = []
  
  actions_enabled           = "true"
  alarm_actions             = [aws_sns_topic.cloud_watch_alarm_topic[count.index].arn]
  tags                      = local.common_tags
}
