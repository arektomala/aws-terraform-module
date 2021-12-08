resource "aws_iam_policy" "iam_policy" {
  for_each = var.iam_policy

  description = each.value.description
  name = each.value.name
  name_prefix = each.value.name_prefix
  path = each.value.path
  policy = each.value.policy
}
