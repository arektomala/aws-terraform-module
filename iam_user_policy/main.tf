resource "aws_iam_user_policy" "iam_user_policy" {
  for_each = var.iam_user_policy

  policy = each.value.policy
  name = each.value.name
  name_prefix = each.value.name_prefix
  user = each.value.user
}