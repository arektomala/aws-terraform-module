variable "availability_zone" {
  type = string
}
variable "availability_zone_id" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "customer_owned_ipv4_pool" {
  type = string
}
variable "ipv6_cidr_block" {
  type = string
}
variable "map_customer_owned_ip_on_launch" {
  type = bool
}
variable "map_public_ip_on_launch" {
  type = bool
}
variable "outpost_arn" {
  type = string
}
variable "assign_ipv6_address_on_creation" {
  type = bool
}
variable "vpc_id" {
  type = string
}
variable "tags" {
  type = map(string)
}