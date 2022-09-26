# cloudwatch-alarm-dashboard-ec2

This is a sample project for creating Cloudwatch alarms and Cloudwatch dashboards with various metrics. The project also comes bundled with EC2 instances (installed with Jenkins) to test the Cloudwatch metrics.

Metrics monitored:

* EC2 CPU utilization
* EC2 network in
* EC2 network out
* EC2 disk read
* EC2 disk write
* API gateway
* Backups
* Transit gateway stats
* VPN stats
* Athena stats
* ELB stats
* Lambda stats
* S3 stats

Alarms:

* High CPU (at 80%)
* Backup failure
* VPN status

See [here](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html) for a list of AWS services that publish CloudWatch metrics.