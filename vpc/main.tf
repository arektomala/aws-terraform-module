resource "aws_vpc" "vpc" {

  for_each = var.vpc

  cidr_block = each.value.cidr_block
  instance_tenancy = each.value.instance_tenancy
  enable_dns_support = each.value.enable_dns_support
  enable_dns_hostnames = each.value.enable_dns_hostnames
  enable_classiclink = each.value.enable_classiclink
  enable_classiclink_dns_support = each.value.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = each.value.assign_generated_ipv6_cidr_block
  tags = each.value.tags

  lifecycle {
    create_before_destroy = true
  }
}
