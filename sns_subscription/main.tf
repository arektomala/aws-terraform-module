resource "aws_sns_topic_subscription" "sns_subscription" {
  for_each = var.sns_subscription
  
  topic_arn = each.value.topic_arn
  protocol = each.value.protocol
  endpoint = each.value.endpoint
  endpoint_auto_confirms = each.value.endpoint_auto_confirms
  confirmation_timeout_in_minutes = each.value.confirmation_timeout_in_minutes
  raw_message_delivery = each.value.raw_message_delivery
  filter_policy = each.value.filter_policy
  delivery_policy = each.value.delivery_policy
}