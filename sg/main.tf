resource "aws_security_group" "security_group" {
  for_each = var.security_groups

  name = each.value.name
  name_prefix = each.value.name_prefix
  description = each.value.description

  dynamic "ingress" {
    for_each = each.value.ingress[*]
    content {
      cidr_blocks = ingress.value.cidr_blocks
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
      prefix_list_ids = ingress.value.prefix_list_ids
      from_port = ingress.value.from_port
      protocol = ingress.value.protocol
      security_groups = ingress.value.security_groups
      self = ingress.value.self
      to_port = ingress.value.to_port
      description = ingress.value.description
    }
  }
  dynamic "egress" {
    for_each = each.value.egress[*]
    content {
      cidr_blocks = egress.value.cidr_blocks
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
      prefix_list_ids = egress.value.prefix_list_ids
      from_port = egress.value.from_port
      protocol = egress.value.protocol
      security_groups = egress.value.security_groups
      self = egress.value.self
      to_port = egress.value.to_port
      description = egress.value.description
    }
  }
  revoke_rules_on_delete = each.value.revoke_rules_on_delete
  vpc_id = each.value.vpc_id
  tags = each.value.tags

  dynamic "timeouts" {
    for_each = each.value.timeouts[*]
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }

  lifecycle {
    create_before_destroy = false
  }
}
