resource "aws_db_parameter_group" "rds_pg" {
  for_each = var.rds_pg

  name = each.value.name
  name_prefix = each.value.name_prefix
  family = each.value.family
  description = each.value.description

  dynamic "parameter" {
    for_each = each.value.parameter[*]
    content {
      name = parameter.value.name
      value = parameter.value.value
      apply_method = parameter.value.apply_method
    }
  }
  tags = each.value.tags
}