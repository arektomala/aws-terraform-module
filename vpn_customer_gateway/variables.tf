variable "customer_gateway" {
  type = map(object({
    bgp_asn = number
    ip_address = string
    type = string
  }))
}