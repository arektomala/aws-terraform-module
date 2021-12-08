resource "aws_iam_access_key" "iam_access_key" {
  for_each = var.iam_access_key

  user = each.value.user
  pgp_key = each.value.pgp_key
  status = each.value.status
}