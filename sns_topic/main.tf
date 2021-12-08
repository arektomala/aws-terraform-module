resource "aws_sns_topic" "sns-topic" {
  for_each = var.sns
  
  name = each.value.name
  name_prefix = each.value.name_prefix
  display_name = each.value.display_name
  policy = each.value.policy
  delivery_policy = each.value.delivery_policy
  application_success_feedback_role_arn = each.value.application_success_feedback_role_arn
  application_success_feedback_sample_rate  = each.value.application_success_feedback_sample_rate
  application_failure_feedback_role_arn = each.value.application_failure_feedback_role_arn
  http_success_feedback_role_arn = each.value.http_success_feedback_role_arn
  http_success_feedback_sample_rate = each.value.http_success_feedback_sample_rate
  http_failure_feedback_role_arn = each.value.http_failure_feedback_role_arn
  kms_master_key_id = each.value.kms_master_key_id
  lambda_success_feedback_role_arn = each.value.lambda_success_feedback_role_arn
  lambda_success_feedback_sample_rate = each.value.lambda_success_feedback_sample_rate
  lambda_failure_feedback_role_arn = each.value.lambda_failure_feedback_role_arn
  sqs_success_feedback_role_arn = each.value.sqs_success_feedback_role_arn
  sqs_success_feedback_sample_rate = each.value.sqs_success_feedback_sample_rate
  sqs_failure_feedback_role_arn = each.value.sqs_failure_feedback_role_arn
  tags = each.value.tags
}