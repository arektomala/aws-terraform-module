resource "aws_route53_zone" "route53_zone" {
  for_each = var.r53_zone

  name = each.value.name
  comment = each.value.comment
  delegation_set_id = each.value.delegation_set_id
  force_destroy = each.value.force_destroy
  tags = each.value.tags

  dynamic "vpc" {
    for_each = each.value.vpc[*]
    content {
      vpc_id = vpc.value.vpc_id
      vpc_region = vpc.value.vpc_region
    }
  }
}