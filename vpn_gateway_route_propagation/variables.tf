variable "vpn_gateway_route_propagation" {
  type = map(object({
    vpn_gateway_id = string
    route_table_id = string
  }))
}