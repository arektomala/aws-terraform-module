resource "aws_iam_group_policy_attachment" "iam_group_policy_attachment" {
  for_each = var.group_policy_attachment

  group = each.value.group
  policy_arn = each.value.policy_arn
}
