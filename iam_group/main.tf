resource "aws_iam_group" "iam_group" {
  for_each = var.iam_group

  name = each.value.name
  path = each.value.path
}
