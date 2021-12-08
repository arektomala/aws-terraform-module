variable "eip" {
  
  type = map(object({
    vpc = bool
    instance = string
    network_interface = string
    associate_with_private_ip = string
    tags = map(string)
    public_ipv4_pool = string
    customer_owned_ipv4_pool = string
    network_border_group = string
  }))

  default = {
    eip = {
      vpc = true
      instance = null
      network_interface = null
      associate_with_private_ip = null
      tags = {
        "Environment" : "dev"
      } 
      public_ipv4_pool = ""
      customer_owned_ipv4_pool = ""
      network_border_group = ""
    }
  }
}