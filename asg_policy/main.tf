resource "aws_autoscaling_policy" "asg_policy" {
  for_each = var.asg_policy

  name = each.value.name
  autoscaling_group_name = each.value.autoscaling_group_name
  adjustment_type = each.value.adjustment_type
  policy_type = each.value.policy_type
  estimated_instance_warmup = each.value.estimated_instance_warmup
  min_adjustment_magnitude = each.value.min_adjustment_magnitude
  cooldown = each.value.cooldown
  scaling_adjustment = each.value.scaling_adjustment
  metric_aggregation_type = each.value.metric_aggregation_type

  dynamic "step_adjustment" {
    for_each = each.value.step_adjustment[*]
    content {
      scaling_adjustment = step_adjustment.value.scaling_adjustment
      metric_interval_lower_bound = step_adjustment.value.metric_interval_lower_bound
      metric_interval_upper_bound = step_adjustment.value.metric_interval_upper_bound
    }
  }

  dynamic "target_tracking_configuration" {
    for_each = each.value.target_tracking_configuration[*]
    content {
      dynamic "predefined_metric_specification" {
        for_each = target_tracking_configuration.value.predefined_metric_specification[*]
        content {
          predefined_metric_type = predefined_metric_specification.value.predefined_metric_type
          resource_label = predefined_metric_specification.value.resource_label
        }
      }
      dynamic "customized_metric_specification" {
        for_each = target_tracking_configuration.value.customized_metric_specification[*]
        content {
          dynamic "metric_dimension" {
            for_each = customized_metric_specification.value.metric_dimension[*]
            content {
              name = metric_dimension.value.name
              value = metric_dimension.value.value
            }
          }
          metric_name = customized_metric_specification.value.metric_name
          namespace = customized_metric_specification.value.namespace
          statistic = customized_metric_specification.value.statistic
          unit = customized_metric_specification.value.unit
        }
      }
      target_value = target_tracking_configuration.value.target_value
      disable_scale_in = target_tracking_configuration.value.disable_scale_in
    }
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [adjustment_type,metric_aggregation_type]
  }
}