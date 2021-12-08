resource "aws_db_subnet_group" "rdssg" {
  for_each = var.rdssg

  name = each.value.name
  name_prefix = each.value.name_prefix
  description = each.value.description
  subnet_ids = each.value.subnet_ids
  tags = each.value.tags
}

