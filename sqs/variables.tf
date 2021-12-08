variable "sqs" {
  description = "SQS"
  type = map(object({
    name = string
    name_prefix = string
    visibility_timeout_seconds = number
    message_retention_seconds = number
    max_message_size = number
    delay_seconds = number
    receive_wait_time_seconds = number
    policy = string
    redrive_policy = string
    fifo_queue = bool
    content_based_deduplication = bool
    kms_master_key_id = string
    kms_data_key_reuse_period_seconds = number
    tags = map(string)
  }))
  default = {
    1 = {
      name = "Default SQS name"
      name_prefix = null
      visibility_timeout_seconds = 30
      message_retention_seconds = 345600
      max_message_size = 262144
      delay_seconds = 0
      receive_wait_time_seconds = 0
      policy = null
      redrive_policy = null
      fifo_queue = false
      content_based_deduplication = true
      kms_master_key_id = null
      kms_data_key_reuse_period_seconds = 300
      tags = {
        "Name":"Default SQS tag name"
      }
    }
  }
}