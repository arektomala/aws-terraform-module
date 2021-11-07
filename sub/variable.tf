variable "subnet" {
  description = "subnet"
  type = map(object({
    availability_zone = string
    availability_zone_id = string
    cidr_block = string
    customer_owned_ipv4_pool = string
    ipv6_cidr_block = string
    map_customer_owned_ip_on_launch = bool
    map_public_ip_on_launch = bool
    outpost_arn = string
    assign_ipv6_address_on_creation = bool
    vpc_id = string
    tags = map(string)
  }))
}
