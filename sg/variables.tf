variable "security_groups" {
  description = "SG with SG rules"
  type = map(object({
    name = string
    name_prefix = string
    description = string
    ingress = list(object({
      cidr_blocks = list(string)
      ipv6_cidr_blocks = list(string)
      prefix_list_ids = list(string)
      from_port = number
      protocol = string
      security_groups = list(string)
      self = bool
      to_port = number
      description = string
    }))
    egress = list(object({
      cidr_blocks = list(string)
      ipv6_cidr_blocks = list(string)
      prefix_list_ids = list(string)
      from_port = number
      protocol = string
      security_groups = list(string)
      self = bool
      to_port = number
      description = string
    }))
    revoke_rules_on_delete = bool
    vpc_id = string
    tags = map(string)
    timeouts = object({
      create = string
      delete = string
    })
  }))
}