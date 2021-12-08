variable "targetgroup" {
  description = "TG"
  type = map(object({
    name = string
    name_prefix = string
    port = number
    protocol = string
    vpc_id = string
    deregistration_delay = number
    slow_start = number
    load_balancing_algorithm_type = string
    lambda_multi_value_headers_enabled = bool
    proxy_protocol_v2 = bool
    stickiness = object({
      type = string
      cookie_duration = number
      enabled = bool
    })
    health_check = object({
      enabled = bool
      interval = number
      path = string
      port = string
      protocol = string
      timeout = number
      healthy_threshold = number
      unhealthy_threshold = number
      matcher = string
    })
    target_type = string
    tags = map(string)
  }))
}
