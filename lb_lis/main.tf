resource "aws_lb_listener" "alb_listener" {
  for_each = var.alb_listener_rules

  load_balancer_arn = each.value.load_balancer_arn
  port = each.value.port
  protocol = each.value.protocol
  ssl_policy = each.value.ssl_policy
  certificate_arn = each.value.certificate_arn

  dynamic "default_action" {
    for_each = each.value.default_action[*]
    content {
      type = default_action.value.type
      target_group_arn = default_action.value.target_group_arn

      dynamic "forward" {
        for_each = each.value.default_action.forward[*]
        content {

          dynamic "target_group" {
            for_each = default_action.value.forward.target_group[*]
            content {
              arn = target_group.value.arn
              weight = target_group.value.weight
            }
          }

          dynamic "stickiness" {
            for_each = default_action.value.forward.stickiness[*]
            content {
              enabled = stickiness.value.enabled
              duration = stickiness.value.duration
            }
          }
        }
      }
      dynamic "redirect" {
        for_each = each.value.default_action.redirect[*]
        content {
          host = redirect.value.host
          path = redirect.value.path
          port = redirect.value.port
          protocol = redirect.value.protocol
          query = redirect.value.query
          status_code = redirect.value.status_code
        }
      }

      dynamic "fixed_response" {
        for_each = each.value.default_action.fixed_response[*]
        content {
          content_type = fixed_response.value.content_type
          message_body = fixed_response.value.message_body
          status_code = fixed_response.value.status_code
        }
      }

    }
  }
}