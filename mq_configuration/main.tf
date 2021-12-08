resource "aws_mq_configuration" "mq_conf" {
   
for_each = var.mq_conf

data = each.value.data
description = each.value.description
engine_type = each.value.engine_type
engine_version = each.value.engine_version
name = each.value.name
tags = each.value.tags
}