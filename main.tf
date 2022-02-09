# ChatBot自体はTerraform未対応のため手動で設定
# SNS Topicのみ

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  metrics_notification     = "${var.tf.fullname}-metrics-notification"
  healthcheck_notification = "${var.tf.fullname}-healthcheck-notification"
}

# サーバー等メトリクス通知用トピック
resource "aws_sns_topic" "metrics_notification" {
  name         = local.metrics_notification
  display_name = local.metrics_notification
  tags = {
    Name = "${var.tf.fullname}-${local.metrics_notification}"
  }
}

resource "aws_sns_topic_policy" "metrics_notification" {
  arn = aws_sns_topic.metrics_notification.arn
  policy = jsonencode({
    Version : "2008-10-17",
    Statement : [
      {
        Sid : "Publish Topic",
        Effect : "Allow",
        Principal : {
          Service : [
            "cloudwatch.amazonaws.com"
          ]
        },
        Action : [
          "sns:Publish"
        ],
        Resource : aws_sns_topic.metrics_notification.arn,
        Condition : {
          ArnLike : {
            "aws:SourceArn" : "arn:aws:cloudwatch:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:alarm:*"
          }
        }
      }
    ]
  })
}

resource "aws_sns_topic_subscription" "metrics_notification" {
  topic_arn = aws_sns_topic.metrics_notification.arn
  protocol  = "https"
  endpoint  = "https://global.sns-api.chatbot.amazonaws.com"
}

# Route53ヘルスチェック用トピック
resource "aws_sns_topic" "healthcheck_notification" {
  provider     = aws.useast1
  name         = local.healthcheck_notification
  display_name = local.healthcheck_notification
  tags = {
    Name = "${var.tf.fullname}-${local.healthcheck_notification}"
  }
}

resource "aws_sns_topic_policy" "healthcheck_notification" {
  provider = aws.useast1
  arn      = aws_sns_topic.healthcheck_notification.arn
  policy = jsonencode({
    Version : "2008-10-17",
    Statement : [
      {
        Sid : "Publish Topic",
        Effect : "Allow",
        Principal : {
          Service : [
            "cloudwatch.amazonaws.com"
          ]
        },
        Action : [
          "sns:Publish"
        ],
        Resource : aws_sns_topic.healthcheck_notification.arn,
        Condition : {
          ArnLike : {
            "aws:SourceArn" : "arn:aws:cloudwatch:us-east-1:${data.aws_caller_identity.current.account_id}:alarm:*"
          }
        }
      }
    ]
  })
}

resource "aws_sns_topic_subscription" "healthcheck_notification" {
  provider  = aws.useast1
  topic_arn = aws_sns_topic.healthcheck_notification.arn
  protocol  = "https"
  endpoint  = "https://global.sns-api.chatbot.amazonaws.com"
}
