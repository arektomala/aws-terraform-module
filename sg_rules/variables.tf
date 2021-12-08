//variable "sgr_type" {
//  type = string
//  description = "Rule type ingress/egress"
//  default = "egess"
//}
//variable "sgr_from_port" {
//  type = string
//  description = "Rule start port, range 1-65535"
//  default = "1"
//}
//variable "sgr_to_port" {
//  type = string
//  description = "Rule end port, range 1-65535"
//  default = "1"
//}
//variable "sgr_protocol" {
//  type = string
//  description = "Rule protocol, icmp, tcp, udp, all or use the protocol number"
//  default = "tcp"
//}
//variable "sgr_cidr_blocks" {
//  description = "List of CIDR blocks"
//}
//variable "sgr_description" {
//  type = string
//  description = "Description of security group rule"
//  default = "SJ3 security group rule default description"
//}
//variable "output_sg_aws_security_group_id" {
//  description = "ID of Security Group to which specyfic rule should belong"
//}