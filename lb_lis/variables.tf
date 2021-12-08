#ALB listener variables

variable "alb_listener_rules" {
  type = map(object({
    load_balancer_arn = string
    port = number
    protocol = string
    ssl_policy = string
    certificate_arn = string
    default_action = object({
      type = string
      target_group_arn = string
      forward = object({
        target_group = object({
          arn = string
          weight = number
        })
        stickiness = object({
          enabled = string
          duration = number
        })
      })
      redirect = object({
        host = string
        path = string
        port = number
        protocol = string
        query = string
        status_code = string
      })
      fixed_response = object({
        content_type = string
        message_body = string
        status_code = number
      })
    })
  }))
}

/*variable "albl_aws_lb_listener_action_type" {
  description = "alb listener action type "
}
variable "albl_aws_lb_listener_alb_arn" {
  description = "alb arn"
}
variable "albl_aws_lb_listener_port" {
  description = "alb listener port"
}
variable "albl_aws_lb_listener_protocol" {
  description = "alb listener protocol"
}
variable "albl_aws_lb_listener_tg_arn" {
  description = "alb listner target group arn "
}
variable "albl_aws_lb_certificate_arn" {
  description = "alb certificates arn"
}*/
