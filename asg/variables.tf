variable "asg" {
  description = "ASG"
  type = map(object({
    name = string
    name_prefix = string
    max_size = number
    min_size = number
    availability_zones = list(string)
    capacity_rebalance = bool
    default_cooldown = number
    launch_configuration = string
    launch_template = object({
      id = string
      name = string
      version = string
    })
    mixed_instances_policy = object({
      instances_distribution = object({
        on_demand_allocation_strategy = string
        on_demand_base_capacity = number
        on_demand_percentage_above_base_capacity = number
        spot_allocation_strategy = string
        spot_instance_pools = number
        spot_max_price = number
      })
      launch_template = object({
        launch_template_specification = object({
          launch_template_id = string
          launch_template_name = string
          version = string
        })
        override = list(object({
          instance_type = string
          weighted_capacity = number
        }))
      })
    })
    #initial_lifecycle_hook = list(string)
    health_check_grace_period = number
    health_check_type = string
    desired_capacity = number
    force_delete = bool
    load_balancers = list(string)
    vpc_zone_identifier = list(string)
    target_group_arns = list(string)
    termination_policies = list(string)
    suspended_processes = list(string)
    tag = list(object({
      key = string
      value = string
      propagate_at_launch = string
    }))
    tags = map(string)
    placement_group = string
    metrics_granularity = string
    enabled_metrics = list(string)
    wait_for_capacity_timeout = string
    min_elb_capacity = number
    wait_for_elb_capacity = number
    protect_from_scale_in = string
    service_linked_role_arn = string
    max_instance_lifetime = number
    instance_refresh = object({
      strategy = string
      preferences = object({
        instance_warmup = number
        min_healthy_percentage = number
      })
      triggers = string
    })
  }))
}