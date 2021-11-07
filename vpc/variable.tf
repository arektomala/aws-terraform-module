variable "cidr_block" {
  type = string
}
variable "instance_tenancy" {
  type = string
}
variable "enable_dns_support" {
  type = bool
}
variable "enable_dns_hostnames" {
  type = bool
}
variable "enable_classiclink" {
  type = bool
}
variable "enable_classiclink_dns_support" {
  type = bool
}
variable "assign_generated_ipv6_cidr_block" {
  type = bool
}
variable "tags" {
  type = map(string)
  default = ""
}