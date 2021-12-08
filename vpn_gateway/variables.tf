variable "vpn_gateway" {
  type = map(object({
    vpc_id = string
    availability_zone = string
    tags = map(string)
    amazon_side_asn = string
  }))
}