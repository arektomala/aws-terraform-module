variable "vpn_connection_route" {
  type = map(object({
    destination_cidr_block = string
    vpn_connection_id = string
  }))
}