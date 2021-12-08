resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  for_each = var.iam_role_policy_attachment

  role = each.value.role
  policy_arn = each.value.policy_arn
}