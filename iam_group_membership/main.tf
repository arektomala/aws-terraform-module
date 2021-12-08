resource "aws_iam_group_membership" "group_membership" {
  for_each = var.group_membership

  name = each.value.name
  users = each.value.users
  group = each.value.group
}
