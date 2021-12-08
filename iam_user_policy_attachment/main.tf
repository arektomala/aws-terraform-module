resource "aws_iam_user_policy_attachment" "iam_user_policy_attachment" {
  for_each = var.iam_user_policy_attachment

  policy_arn = each.value.policy_arn
  user = each.value.user
}