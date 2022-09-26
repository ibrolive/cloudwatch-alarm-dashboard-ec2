terraform {
    required_version = ">= 0.14.3"
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "jenkins_master" {
    ami                         = data.aws_ami.amazon-linux-2.id # Amaxon Linux 2 AMI
    count                       = 1
    instance_type               = var.jenkins_master
    key_name                    = var.key_name
    associate_public_ip_address = true
    vpc_security_group_ids      = [module.http_sg.security_group_id]
    user_data                   = templatefile("${path.cwd}/templates/master-bootstrap.tmpl", {})

    tags = {
        Name            = "Jenkins-Master"
        ProvisionedBy   = "Terraform"
    }
}


resource "aws_instance" "jenkins_slave" {
    ami                         = data.aws_ami.amazon-linux-2.id # Amaxon Linux 2 AMI
    count                       = 2
    instance_type               = var.jenkins_slave
    key_name                    = var.key_name
    associate_public_ip_address = true
    vpc_security_group_ids      = [module.http_sg.security_group_id]
    user_data                   = templatefile("${path.cwd}/templates/slave-bootstrap.tmpl", {})

    tags = {
        Name            = "Jenkins-Slave-${count.index+1}"
        ProvisionedBy   = "Terraform"
    }
}

resource "aws_key_pair" "JenkinsKeyPair" {
  key_name   = "JenkinsKeyPair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 ${var.email}"
}

## OUTPUTS

output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.jenkins_master.*.id
}

output "arn" {
  description = "List of ARNs of instances"
  value       = aws_instance.jenkins_master.*.arn
}

output "password_data" {
  description = "List of Base-64 encoded encrypted password data for the instance"
  value       = aws_instance.jenkins_master.*.password_data
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.jenkins_master.*.public_dns
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.jenkins_master.*.public_ip
}

### SECURITY GROUP

#############################################################
# Data sources to get VPC and default security group details
#############################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

###########################
# Security groups examples
###########################

#######
# HTTP
#######
module "http_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "dynamic-http-sg"
  description = "Security group with HTTP port open for everyone, and HTTPS open just for the default security group"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules            = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 9091
      to_port     = 9091
      protocol    = "tcp"
      description = "Jenkins ports"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

### VARIABLES

variable "email" {
  description = "Email to use in the key pair"
  type        = string
  default     = "email@domain.com"
}
variable "key_name" {
  description = "Key name to be used with the launched EC2 instances."
  default     = "JenkinsKeyPair"
}
variable "jenkins_master" {
  type    = string
  default = "t2.micro"
}
variable "jenkins_slave" {
  type    = string
  default = "t2.micro"
}

