resource "aws_sns_platform_application" "sns_platform_application" {
  for_each = var.sns_platform_application

  name = each.value.name
  platform = each.value.platform
  platform_credential = each.value.platform_credential
  event_delivery_failure_topic_arn = each.value.event_delivery_failure_topic_arn
  event_endpoint_created_topic_arn = each.value.event_endpoint_created_topic_arn
  event_endpoint_deleted_topic_arn = each.value.event_endpoint_deleted_topic_arn
  event_endpoint_updated_topic_arn = each.value.event_endpoint_updated_topic_arn
  failure_feedback_role_arn = each.value.failure_feedback_role_arn
  platform_principal = each.value.platform_principal
  success_feedback_role_arn = each.value.success_feedback_role_arn
  success_feedback_sample_rate = each.value.success_feedback_sample_rate
}