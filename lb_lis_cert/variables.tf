#ALB listener variables

variable "alb_listener_certificate" {
  type = map(object({
    listener_arn  = string
    certificate_arn = string
  }))
}
