variable "sns" {
  description = ""
  type = map(object({
    name = string
    name_prefix = string
    display_name = string
    policy = string
    delivery_policy = string
    application_success_feedback_role_arn = string
    application_success_feedback_sample_rate  = string
    application_failure_feedback_role_arn = string
    http_success_feedback_role_arn = string
    http_success_feedback_sample_rate = string
    http_failure_feedback_role_arn = string
    kms_master_key_id = string
    lambda_success_feedback_role_arn = string
    lambda_success_feedback_sample_rate = string
    lambda_failure_feedback_role_arn = string
    sqs_success_feedback_role_arn = string
    sqs_success_feedback_sample_rate = string
    sqs_failure_feedback_role_arn = string
    tags = map(string)
  }))
  default = {
    1 = {
      name = "Default SNS topic name"
      name_prefix = null
      display_name = "Default SNS topic name"
      policy = null
      delivery_policy = null
      application_success_feedback_role_arn = null
      application_success_feedback_sample_rate  = null
      application_failure_feedback_role_arn = null
      http_success_feedback_role_arn = null
      http_success_feedback_sample_rate = null
      http_failure_feedback_role_arn = null
      kms_master_key_id = null
      lambda_success_feedback_role_arn = null
      lambda_success_feedback_sample_rate = null
      lambda_failure_feedback_role_arn = null
      sqs_success_feedback_role_arn = null
      sqs_success_feedback_sample_rate = null
      sqs_failure_feedback_role_arn = null
      tags = {
        "Name":"Default SNS topic name"
      }
    }
  }
}