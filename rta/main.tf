resource "aws_route_table_association" "rta" {
  for_each = var.rta

  subnet_id = each.value.subnet_id
  gateway_id = each.value.gateway_id
  route_table_id = each.value.route_table_id

  lifecycle {
    create_before_destroy = true
  }
}