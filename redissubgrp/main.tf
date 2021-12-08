resource "aws_elasticache_subnet_group" "redis_sub_grp" {
  for_each = var.redissubgrp
  name = each.value.name
  description = each.value.description
  subnet_ids = each.value.subnet_ids
}
