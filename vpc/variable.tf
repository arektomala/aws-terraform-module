variable "vpc" {
  type = map(object({
    cidr_block = string
    instance_tenancy = string
    enable_dns_support = bool
    enable_dns_hostnames = bool
    enable_classiclink = bool
    enable_classiclink_dns_support = bool
    assign_generated_ipv6_cidr_block = bool
    tags = map(string)
  }))
}
