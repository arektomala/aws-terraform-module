resource "aws_route_table" "rt" {
  for_each = var.rt

  vpc_id = each.value.vpc_id

  dynamic "route" {
    for_each = each.value.route[*]
    content {
      // one of two below
      cidr_block = route.value.cidr_block
      ipv6_cidr_block = route.value.ipv6_cidr_block
      // one of nine below
      egress_only_gateway_id = route.value.egress_only_gateway_id
      gateway_id = route.value.gateway_id
      instance_id = route.value.instance_id
      nat_gateway_id = route.value.nat_gateway_id
      local_gateway_id = route.value.local_gateway_id
      network_interface_id = route.value.network_interface_id
      transit_gateway_id = route.value.transit_gateway_id
      vpc_endpoint_id = route.value.vpc_endpoint_id
      vpc_peering_connection_id = route.value.vpc_peering_connection_id
    }
  }

  tags = each.value.tags
  propagating_vgws = each.value.propagating_vgws

  lifecycle {
    create_before_destroy = true
  }
}
