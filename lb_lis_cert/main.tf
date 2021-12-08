resource "aws_lb_listener_certificate" "alb_listener_certificate" {
  for_each = var.alb_listener_certificate

  listener_arn  = each.value.listener_arn
  certificate_arn = each.value.certificate_arn
}