variable "sns_platform_application" {
  description = ""
  type = map(object({
    name = string
    platform = string
    platform_credential = string
    event_delivery_failure_topic_arn = string
    event_endpoint_created_topic_arn = string
    event_endpoint_deleted_topic_arn = string
    event_endpoint_updated_topic_arn = string
    failure_feedback_role_arn = string
    platform_principal = string
    success_feedback_role_arn = string
    success_feedback_sample_rate = number
  }))
}