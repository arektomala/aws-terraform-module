#ALB listener variables

variable "albl_rules" {
  type = map(object({
    listener_arn = string
    priority = number
    action = object({
      type = string
      target_group_arn = string
      forward = object({
        target_group = object({
          arn = string
          weight = number
        })
        stickiness = object({
          enabled = bool
          duration = number
        })
      })
      redirect = object({
        host = string
        path = string
        port = number
        protocol = string
        query = string
        status_code = number
      })
      fixed_response = object({
        content_type = string
        message_body = string
        status_code = number
      })
    })
    condition = object({
      host_header = object({
        values = list(string)
      })
      http_header = object({
        http_header_name = string
        values = string
      })
      http_request_method = object({
        values = list(string)
      })
      path_pattern = object({
        values = list(string)
      })
      query_string = object({
        values = string
      })
      source_ip = object({
        values = string
      })
    })
  }))
}
