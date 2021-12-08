resource "aws_iam_role" "iam_role" {
  for_each = var.iam_role

  assume_role_policy = each.value.assume_role_policy
  description = each.value.description
  force_detach_policies = each.value.force_detach_policies

  dynamic "inline_policy" {
    for_each = each.value.inline_policy[*]

    content {
      name = inline_policy.value.name
      policy = inline_policy.value.policy
    }
  }

  managed_policy_arns = each.value.managed_policy_arns
  max_session_duration = each.value.max_session_duration
  name = each.value.name
  name_prefix = each.value.name_prefix
  path = each.value.path
  permissions_boundary = each.value.permissions_boundary
  tags = each.value.tags
}
