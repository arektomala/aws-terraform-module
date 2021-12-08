resource "aws_nat_gateway" "ngw" {
  for_each = var.ngw

  allocation_id = each.value.allocation_id
  subnet_id = each.value.subnet_id
  tags = each.value.tags

  lifecycle {
    create_before_destroy = true
  }
}
