resource "aws_vpn_gateway_route_propagation" "vpn_gateway_route_propagation" {

  for_each = var.vpn_gateway_route_propagation

  vpn_gateway_id = each.value.vpn_gateway_id
  route_table_id = each.value.route_table_id
}
