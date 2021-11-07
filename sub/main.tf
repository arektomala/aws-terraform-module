resource "aws_subnet" "subnet" {
  for_each = var.availability_zone

  availability_zone = each.value.availability_zone
  availability_zone_id = each.value.availability_zone_id
  cidr_block = each.value.cidr_block
  customer_owned_ipv4_pool = each.value.customer_owned_ipv4_pool
  ipv6_cidr_block = each.value.ipv6_cidr_block
  map_customer_owned_ip_on_launch = each.value.map_customer_owned_ip_on_launch
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  outpost_arn = each.value.outpost_arn
  assign_ipv6_address_on_creation = each.value.assign_ipv6_address_on_creation
  vpc_id = each.value.vpc_id
  tags = each.value.tags

  lifecycle {
    create_before_destroy = true
  }
}
