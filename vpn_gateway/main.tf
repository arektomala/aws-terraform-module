resource "aws_vpn_gateway" "vpn_gateway" {

  for_each = var.vpn_gateway

  vpc_id = each.value.vpc_id
  availability_zone = each.value.availability_zone
  tags = each.value.tags
  amazon_side_asn = each.value.amazon_side_asn
}
