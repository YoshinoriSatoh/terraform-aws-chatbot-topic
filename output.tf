output "metrics_notification_topic" {
  value = aws_sns_topic.metrics_notification
}

output "healthcheck_notification_topic" {
  value = aws_sns_topic.healthcheck_notification
}