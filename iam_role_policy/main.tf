resource "aws_iam_role_policy" "iam_role_policy" {
  for_each = var.iam_role_policy

  name = each.value.name
  name_prefix = each.value.name_prefix
  policy = each.value.policy
  role = each.value.role
}