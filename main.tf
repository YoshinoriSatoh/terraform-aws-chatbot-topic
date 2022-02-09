# ChatBot自体はTerraform未対応のため手動で設定
# SNS Topicのみ

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  name = "${var.tf.fullname}-${replace(var.name, "_", "-")}"
}

resource "aws_sns_topic" "notification" {
  name         = local.name
  display_name = local.name
  tags = {
    Name = "${local.name}"
  }
}

# resource "aws_sns_topic_policy" "notification" {
#   arn = aws_sns_topic.notification.arn
#   policy = jsonencode({
#     Version : "2008-10-17",
#     Statement : [
#       {
#         Sid : "Publish Topic",
#         Effect : "Allow",
#         Principal : {
#           Service : [
#             "cloudwatch.amazonaws.com"
#           ]
#         },
#         Action : [
#           "sns:Publish"
#         ],
#         Resource : aws_sns_topic.notification.arn,
#         Condition : {
#           ArnLike : {
#             "aws:SourceArn" : "arn:aws:cloudwatch:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:alarm:*"
#           }
#         }
#       }
#     ]
#   })
# }

# resource "aws_sns_topic_subscription" "notification" {
#   topic_arn = aws_sns_topic.notification.arn
#   protocol  = "https"
#   endpoint  = "https://global.sns-api.chatbot.amazonaws.com"
# }
