resource "aws_lb" "lb" {
  for_each = var.lb

  name = each.value.name != null ? each.value.name : null
  name_prefix = each.value.name_prefix != null ? each.value.name_prefix : null
  internal = each.value.internal
  load_balancer_type = each.value.load_balancer_type
  security_groups = each.value.security_groups
  drop_invalid_header_fields = each.value.drop_invalid_header_fields

  dynamic "access_logs" {
    for_each = each.value.access_logs[*]
    content {
      bucket = access_logs.value.bucket
      prefix = access_logs.value.prefix
      enabled = access_logs.value.enabled
    }
  }

  subnets = each.value.subnets

  dynamic "subnet_mapping" {
    for_each = each.value.subnet_mapping[*]
    content {
      subnet_id = subnet_mapping.value.subnet_id
      allocation_id = subnet_mapping.value.allocation_id
      private_ipv4_address  = subnet_mapping.value.private_ipv4_address
    }
  }
  idle_timeout = each.value.idle_timeout
  enable_deletion_protection = each.value.enable_deletion_protection
  enable_cross_zone_load_balancing = each.value.enable_cross_zone_load_balancing
  enable_http2 = each.value.enable_http2
  customer_owned_ipv4_pool = each.value.customer_owned_ipv4_pool
  ip_address_type = each.value.ip_address_type
  tags = each.value.tags
}
