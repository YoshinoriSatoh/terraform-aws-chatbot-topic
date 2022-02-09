<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.74.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.74.0 |
| <a name="provider_aws.useast1"></a> [aws.useast1](#provider\_aws.useast1) | 3.74.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.healthcheck_notification](https://registry.terraform.io/providers/hashicorp/aws/3.74.0/docs/resources/sns_topic) | resource |
| [aws_sns_topic.metrics_notification](https://registry.terraform.io/providers/hashicorp/aws/3.74.0/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.healthcheck_notification](https://registry.terraform.io/providers/hashicorp/aws/3.74.0/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_policy.metrics_notification](https://registry.terraform.io/providers/hashicorp/aws/3.74.0/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.healthcheck_notification](https://registry.terraform.io/providers/hashicorp/aws/3.74.0/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic_subscription.metrics_notification](https://registry.terraform.io/providers/hashicorp/aws/3.74.0/docs/resources/sns_topic_subscription) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/3.74.0/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/3.74.0/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tf"></a> [tf](#input\_tf) | n/a | <pre>object({<br>    name          = string<br>    shortname     = string<br>    env           = string<br>    fullname      = string<br>    fullshortname = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_healthcheck_notification_topic"></a> [healthcheck\_notification\_topic](#output\_healthcheck\_notification\_topic) | n/a |
| <a name="output_metrics_notification_topic"></a> [metrics\_notification\_topic](#output\_metrics\_notification\_topic) | n/a |
<!-- END_TF_DOCS -->    