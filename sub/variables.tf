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


  default = {
    priv = {
      availability_zone = "defaultzone"
      availability_zone_id = null
      cidr_block = "defaultblock"
      customer_owned_ipv4_pool = ""
      ipv6_cidr_block = null
      map_customer_owned_ip_on_launch = false
      map_public_ip_on_launch = false
      outpost_arn = ""
      assign_ipv6_address_on_creation = false
      vpc_id = "def vpc"
      tags = {
        "Environment" : "dev"
      }


    }
  } 
}