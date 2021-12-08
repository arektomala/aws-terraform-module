resource "aws_vpn_connection_route" "vpn_connection_route" {

  for_each = var.vpn_connection_route

  destination_cidr_block = each.value.destination_cidr_block
  vpn_connection_id = each.value.vpn_connection_id
}
