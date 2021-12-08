variable "sns_subscription" {
  description = "Subsrtiption for topic"
  type = map(object({
    topic_arn = string
    protocol = string
    endpoint = string
    endpoint_auto_confirms = string
    confirmation_timeout_in_minutes = number
    raw_message_delivery = string
    filter_policy = string
    delivery_policy = string
  }))
  default = {
    1 = {
      topic_arn = ""
      protocol = ""
      endpoint = ""
      endpoint_auto_confirms = null
      confirmation_timeout_in_minutes = null
      raw_message_delivery = null
      filter_policy = null
      delivery_policy = null
    }
  }
}