variable "asg_policy" {
  description = "ASG policy"
  type = map(object({
    name = string
    autoscaling_group_name = string
    adjustment_type = string
    policy_type = string
    estimated_instance_warmup = number
    min_adjustment_magnitude = number
    cooldown = number
    scaling_adjustment = number
    metric_aggregation_type = string
    step_adjustment = list(object({
      scaling_adjustment = number
      metric_interval_lower_bound = number
      metric_interval_upper_bound = number
    }))
    target_tracking_configuration = object({
      predefined_metric_specification = object({
        predefined_metric_type = string
        resource_label = string
      })
      customized_metric_specification = object({
        metric_dimension = object({
          name = string
          value = string
        })
        metric_name = string
        namespace = string
        statistic = string
        unit = string
      })
      target_value = number
      disable_scale_in = bool
    })
  }))
}