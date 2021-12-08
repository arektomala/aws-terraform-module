resource "aws_lb_target_group" "targetgroup" {
  for_each = var.targetgroup

  name = each.value.name
  name_prefix = each.value.name_prefix
  port = each.value.port
  protocol = each.value.protocol
  vpc_id = each.value.vpc_id
  deregistration_delay = each.value.deregistration_delay
  slow_start = each.value.slow_start
  load_balancing_algorithm_type = each.value.load_balancing_algorithm_type
  lambda_multi_value_headers_enabled = each.value.lambda_multi_value_headers_enabled
  proxy_protocol_v2 = each.value.proxy_protocol_v2

  dynamic "stickiness" {
    for_each = each.value.stickiness[*]

    content {
      type = stickiness.value.type
      cookie_duration = stickiness.value.cookie_duration
      enabled = stickiness.value.enabled
    }
  }

  dynamic "health_check" {
    for_each = each.value.health_check[*]

    content {
      enabled = health_check.value.enabled
      interval = health_check.value.interval
      path = health_check.value.path
      port = health_check.value.port
      protocol = health_check.value.protocol
      timeout = health_check.value.timeout
      healthy_threshold = health_check.value.healthy_threshold
      unhealthy_threshold = health_check.value.unhealthy_threshold
      matcher = health_check.value.matcher
    }
  }

  target_type = each.value.target_type
  tags = each.value.tags

  lifecycle {
    create_before_destroy = true
  }
}

