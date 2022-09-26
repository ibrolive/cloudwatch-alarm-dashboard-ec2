{
    "widgets": [
      {
        "type": "metric",
        "x": 0,
        "y": 0,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [ { "expression": "SEARCH('{AWS/EC2,InstanceId} MetricName=\"CPUUtilization\"', 'Average', 300)", "id": "e1", "label": "CPU Utilization" } ]
          ],
          "period": 60,
          "liveData": true,
          "stat": "Maximum",
          "region": "${region}",
          "title": "EC2|CPU Utilization"
        }
      },
      {
        "type": "metric",
        "x": 8,
        "y": 0,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [ { "expression": "SEARCH('{AWS/EC2,InstanceId} MetricName=\"NetworkIn\"', 'Maximum', 60)", "id": "e2", "label": "NetworkIn" } ]
          ],
          "period": 60,
          "liveData": true,
          "stat": "Maximum",
          "region": "${region}",
          "title": "EC2|Network In"
        }
      },
      {
        "type": "metric",
        "x": 16,
        "y": 0,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [ { "expression": "SEARCH('{AWS/EC2,InstanceId} MetricName=\"NetworkOut\"', 'Maximum', 60)", "id": "e3", "label": "NetworkOut" } ]
          ],
          "period": 60,
          "liveData": true,
          "stat": "Maximum",
          "region": "${region}",
          "title": "EC2|Network Out"
        }
      },
      {
        "type": "metric",
        "x": 0,
        "y": 6,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [ { "expression": "SEARCH('{AWS/EC2,InstanceId} MetricName=\"DiskReadOps\"', 'Maximum', 60)", "id": "e4", "label": "DiskReadOps" } ]
          ],
          "period": 60,
          "liveData": true,
          "stat": "Maximum",
          "region": "${region}",
          "title": "EC2|Disk Read Ops"
        }
      },
      {
        "type": "metric",
        "x": 8,
        "y": 6,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [ { "expression": "SEARCH('{AWS/EC2,InstanceId} MetricName=\"DiskWriteOps\"', 'Maximum', 60)", "id": "e4", "label": "DiskWriteOps" } ]
          ],
          "period": 60,
          "liveData": true,
          "stat": "Maximum",
          "region": "${region}",
          "title": "EC2|Disk Write Ops"
        }
      },
      {
        "type": "metric",
        "x": 16,
        "y": 6,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [
              "AWS/ApiGateway",
              "4XXError"
            ],
            [
              "AWS/ApiGateway",
              "5XXError"
            ],
            [
              "AWS/ApiGateway",
              "Count"
            ],
            [
              "AWS/ApiGateway",
              "Latency"
            ]
          ],
          "period": 60,
          "stat": "Maximum",
          "region": "${region}",
          "title": "API Gateway|Main Stats"
        }
      },
      {
        "type": "metric",
        "x": 0,
        "y": 12,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [
              "Backup",
              "NumberOfBackupJobsCompleted"
            ],
            [
               "Backup",
              "NumberOfBackupJobsAborted"
            ],
            [
              "Backup",
              "NumberOfBackupJobsFailed"
            ]
          ],
          "period": 60,
          "stat": "Maximum",
          "region": "${region}",
          "title": "Backup|Main Stats"
        }
      },
      {
        "type": "metric",
        "x": 8,
        "y": 12,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [
              "AWS/TransitGateway",
              "BytesDropCountBlackhole"
            ],
            [
               "AWS/TransitGateway",
              "BytesDropCountNoRoute"
            ],
            [
              "AWS/TransitGateway",
              "BytesIn"
            ],
            [
              "AWS/TransitGateway",
              "BytesOut"
            ]
          ],
          "period": 60,
          "stat": "Maximum",
          "region": "${region}",
          "title": "Transit Gateway|Main Stats"
        }
      },
      {
        "type": "metric",
        "x": 16,
        "y": 12,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [
              "AWS/VPN",
              "TunnelState"
            ],
            [
               "AWS/VPN",
              "TunnelDataIn"
            ],
            [
              "AWS/VPN",
              "TunnelDataOut"
            ]
          ],
          "period": 60,
          "stat": "Maximum",
          "region": "${region}",
          "title": "VPN|Main Stats"
        }
      },
      {
        "type": "metric",
        "x": 0,
        "y": 18,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [
              "AWS/Athena",
              "EngineExecutionTime"
            ],
            [
              "AWS/Athena",
              "ProcessedBytes"
            ],
            [
              "AWS/Athena",
              "ServiceProcessingTime"
            ],
            [
              "AWS/Athena",
              "TotalExecutionTime "
            ]
          ],
          "period": 60,
          "stat": "Maximum",
          "region": "${region}",
          "title": "Athena|Main Stats"
        }
      },
      {
        "type": "metric",
        "x": 8,
        "y": 18,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [
              "AWS/ApplicationELB",
              "ActiveConnectionCount"
            ],
            [
              "AWS/ApplicationELB",
              "HTTP_Redirect_Count"
            ],
            [
              "AWS/ApplicationELB",
              "HTTPCode_ELB_4XX_Count"
            ],
            [
              "AWS/ApplicationELB",
              "HTTPCode_ELB_5XX_Count"
            ],
            [
              "AWS/ApplicationELB",
              "NewConnectionCount"
            ],
            [
              "AWS/ApplicationELB",
              "RejectedConnectionCount"
            ]
          ],
          "period": 60,
          "stat": "Maximum",
          "region": "${region}",
          "title": "Application ELB|Main Stats"
        }
      },
      {
        "type": "metric",
        "x": 16,
        "y": 18,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [
              "AWS/ELB",
              "BackendConnectionErrors"
            ],
            [
              "AWS/ELB",
              "HTTPCode_Backend_4XX"
            ],
            [
              "AWS/ELB",
              "HTTPCode_Backend_5XX"
            ],
            [
              "AWS/ELB",
              "Latency"
            ],
            [
              "AWS/ELB",
              "RequestCount"
            ],
            [
              "AWS/ELB",
              "UnHealthyHostCount"
            ]
          ],
          "period": 60,
          "stat": "Maximum",
          "region": "${region}",
          "title": "ELB|Main Stats"
        }
      },
      {
        "type": "metric",
        "x": 0,
        "y": 24,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [
              "AWS/Lambda",
              "Invocations"
            ],
            [
              "AWS/Lambda",
              "Errors"
            ],
            [
              "AWS/Lambda",
              "DestinationDeliveryFailures"
            ],
            [
              "AWS/Lambda",
              "Duration"
            ],
            [
              "AWS/Lambda",
              "RequestCount"
            ]
          ],
          "period": 60,
          "stat": "Maximum",
          "region": "${region}",
          "title": "Lambda|Main Stats"
        }
      },
      {
        "type": "metric",
        "x": 8,
        "y": 24,
        "width": 8,
        "height": 6,
        "properties": {
          "metrics": [
            [
              "AWS/S3",
              "BucketSizeBytes"
            ],
            [
              "AWS/S3",
              "NumberOfObjects"
            ],
            [
              "AWS/S3",
              "DeleteRequests"
            ],
            [
              "AWS/S3",
              "5xxErrors"
            ],
            [
              "AWS/S3",
              "TotalRequestLatency"
            ]
          ],
          "period": 60,
          "stat": "Maximum",
          "region": "${region}",
          "title": "S3|Main Stats"
        }
      }
    ]
  }