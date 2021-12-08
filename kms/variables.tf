variable "kms" {
  description = "kms"
  type = map(object({
    description = string
    key_usage = string
    customer_master_key_spec = string
    policy = string
    deletion_window_in_days = number
    is_enabled = bool
    enable_key_rotation = bool
    tags = map(string)
  }))
}

