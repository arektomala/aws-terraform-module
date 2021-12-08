variable "rt" {
  description = "Route Table"
  type = map(object({
    vpc_id = string
    route = list(object({
      // one of two below
      cidr_block = string
      ipv6_cidr_block = string
      // one of nine below
      egress_only_gateway_id = string
      gateway_id = string
      instance_id = string
      nat_gateway_id = string
      local_gateway_id = string
      network_interface_id = string
      transit_gateway_id = string
      vpc_endpoint_id = string
      vpc_peering_connection_id = string
    }))
    tags = map(string)
    propagating_vgws = list(string)
  }))
}