variable "vpn_gateway_attachment" {
  type = map(object({
    vpc_id = string
    vpn_gateway_id = string
  }))
}