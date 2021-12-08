variable "bn_bucket_notification" {
  description = "Bucket notification"
  type = map(object({
    bucket = string
    topic = list(object({
      id = string
      topic_arn = string
      events = list(string)
      filter_prefix = string
      filter_suffix = string
    }))
    queue = list(object({
      id = string
      queue_arn = string
      events = list(string)
      filter_prefix = string
      filter_suffix = string
    }))
    lambda_function = list(object({
      id = string
      lambda_function_arn = string
      events = list(string)
      filter_prefix = string
      filter_suffix = string
    }))
  }))
}