resource "aws_dlm_lifecycle_policy" "lifecycle_manager" {
  for_each = var.lifecycle_manager

  description = each.value.description
  execution_role_arn = each.value.execution_role_arn

  dynamic "policy_details" {
    for_each = each.value.policy_details[*]
    content {
      resource_types = policy_details.value.resource_types

      dynamic "schedule" {
        for_each = policy_details.value.schedule[*]
        content {
          copy_tags = schedule.value.copy_tags
          dynamic "create_rule" {
            for_each = schedule.value.create_rule[*]
            content {
              interval = create_rule.value.interval
              interval_unit = create_rule.value.interval_unit
              times = create_rule.value.times
            }
          }
          name = schedule.value.name
          dynamic "retain_rule" {
            for_each = schedule.value.retain_rule[*]
            content {
              count = retain_rule.value.count
            }
          }
          tags_to_add = schedule.value.tags_to_add
            }
          }
      target_tags = policy_details.value.target_tags
        }
      }

        }



