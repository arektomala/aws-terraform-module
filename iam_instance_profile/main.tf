resource "aws_iam_instance_profile" "iam_instance_profile" {
  for_each = var.iam_instance_profile

  name = each.value.name
  name_prefix = each.value.name_prefix
  path = each.value.path
  role = each.value.role
}
