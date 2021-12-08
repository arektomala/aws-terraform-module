variable "sqs-policy" {
  description = "SQS policy"
  type = map(object({
    queue_url = string
    policy = string
  }))
  default = {
    1 = {
      queue_url = null
      policy = null
    }
  }
}