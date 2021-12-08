resource "aws_autoscaling_group" "asg" {
  for_each = var.asg

  name = each.value.name
  name_prefix = each.value.name_prefix
  max_size = each.value.max_size
  min_size = each.value.min_size
  availability_zones = each.value.availability_zones
  capacity_rebalance = each.value.capacity_rebalance
  default_cooldown = each.value.default_cooldown
  launch_configuration = each.value.launch_configuration

  dynamic "launch_template" {
    for_each = each.value.launch_template[*]
    content {
      id = launch_template.value.id
      name = launch_template.value.name
      version = launch_template.value.version
    }
  }

  dynamic "mixed_instances_policy" {
    for_each = each.value.mixed_instances_policy[*]
    content {
      dynamic "instances_distribution" {
        for_each = mixed_instances_policy.value.instances_distribution[*]
        content {
          on_demand_allocation_strategy = instances_distribution.value.on_demand_allocation_strategy
          on_demand_base_capacity = instances_distribution.value.on_demand_base_capacity
          on_demand_percentage_above_base_capacity = instances_distribution.value.on_demand_percentage_above_base_capacity
          spot_allocation_strategy = instances_distribution.value.spot_allocation_strategy
          spot_instance_pools = instances_distribution.value.spot_instance_pools
          spot_max_price = instances_distribution.value.spot_max_price
        }
      }
      dynamic "launch_template" {
        for_each = mixed_instances_policy.value.launch_template[*]
        content {
          dynamic "launch_template_specification" {
            for_each = launch_template.value.launch_template_specification[*]
            content {
              launch_template_id = launch_template_specification.value.launch_template_id
              launch_template_name = launch_template_specification.value.launch_template_name
              version = launch_template_specification.value.version
            }
          }
          dynamic "override" {
            for_each = launch_template.value.override[*]
            content {
              instance_type = override.value.instance_type
              weighted_capacity = override.value.weighted_capacity
            }
          }
        }
      }
    }
  }

  health_check_grace_period = each.value.health_check_grace_period
  health_check_type = each.value.health_check_type
  desired_capacity = each.value.desired_capacity
  force_delete = each.value.force_delete
  load_balancers = each.value.load_balancers
  vpc_zone_identifier = each.value.vpc_zone_identifier
  target_group_arns = each.value.target_group_arns
  termination_policies = each.value.termination_policies
  suspended_processes = each.value.suspended_processes

  dynamic "tag" {
    for_each = each.value.tag[*]
    content {
      key = tag.value.key
      value = tag.value.value
      propagate_at_launch = tag.value.propagate_at_launch
    }
  }
  tags = each.value.tags
  placement_group = each.value.placement_group
  metrics_granularity = each.value.metrics_granularity
  enabled_metrics = each.value.enabled_metrics
  wait_for_capacity_timeout = each.value.wait_for_capacity_timeout
  min_elb_capacity = each.value.min_elb_capacity
  wait_for_elb_capacity = each.value.wait_for_elb_capacity
  protect_from_scale_in = each.value.protect_from_scale_in
  service_linked_role_arn = each.value.service_linked_role_arn
  max_instance_lifetime = each.value.max_instance_lifetime

  dynamic "instance_refresh" {
    for_each = each.value.instance_refresh[*]
    content {
      strategy = instance_refresh.value.strategy
      dynamic "preferences" {
        for_each = instance_refresh.value.preferences[*]
        content {
          instance_warmup = preferences.value.instance_warmup
          min_healthy_percentage = preferences.value.min_healthy_percentage
        }
      }
      triggers = instance_refresh.value.triggers
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
