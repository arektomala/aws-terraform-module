//resource "aws_iam_user" "iam_user" {
//  name = var.iam_aws_iam_user_name
//  path = var.iam_aws_iam_user_path
//
//}
//
//resource "aws_iam_user_policy" "policy" {
//  name        = var.iam_aws_iam_policy_name
//  user        = aws_iam_user.iam_user.name
//
//  policy      = var.iam_aws_iam_user_policy_policy
//}
//
//resource "aws_iam_access_key" "iam_access_key" {
//  user = aws_iam_user.iam_user.name
//}

resource "aws_iam_user" "iam_user" {
  for_each = var.iam_user

  name = each.value.name
  path = each.value.path
  permissions_boundary = each.value.permissions_boundary
  force_destroy = each.value.force_destroy
  tags = each.value.tags
}