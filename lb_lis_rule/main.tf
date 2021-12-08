resource "aws_lb_listener_rule" "alb_listener_rule" {
  for_each = var.albl_rules

  listener_arn = each.value.listener_arn
  priority = each.value.priority

  dynamic "action" {
    for_each = each.value.action[*]
    content {
      type = action.value.type
      target_group_arn = action.value.target_group_arn

      dynamic "forward" {
        for_each = each.value.action.forward[*]
        content {

          dynamic "target_group" {
            for_each = each.value.action.forward.target_group[*]
            content {
              arn = target_group.value.arn
              weight = target_group.value.weight
            }
          }
          dynamic "stickiness" {
            for_each = each.value.action.forward.stickiness[*]
            content {
              enabled = stickiness.value.enabled
              duration = stickiness.value.duration
            }
          }
        }
      }

      dynamic "redirect" {
        for_each = each.value.action.redirect[*]
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
        for_each = each.value.action.fixed_response[*]
        content {

          content_type = fixed_response.value.content_type
          message_body = fixed_response.value.message_body
          status_code = fixed_response.value.status_code
        }
      }
    }
  }

  dynamic "condition" {
    for_each = each.value.condition[*]
    content {

      dynamic "host_header" {
        for_each = each.value.condition.host_header[*]
        content {
          values = host_header.value.values
        }
      }

      dynamic "http_header" {
        for_each = each.value.condition.http_header[*]
        content {
          http_header_name = http_header.value.http_header_name
          values = http_header.value.values
        }
      }

      dynamic "http_request_method" {
        for_each = each.value.condition.http_request_method[*]
        content {
          values = http_request_method.value.values
        }
      }

      dynamic "path_pattern" {
        for_each = each.value.condition.path_pattern[*]
        content {
          values = path_pattern.value.values
        }
      }

      dynamic "query_string" {
        for_each = each.value.condition.query_string[*]
        content {
          value = query_string.value.values
        }
      }

      dynamic "source_ip" {
        for_each = each.value.condition.source_ip[*]
        content {
          values = source_ip.value.values
        }
      }
    }
  }

}

