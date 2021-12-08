resource "aws_kms_key" "kms" {
  for_each = var.kms

    description = each.value.description
    key_usage = each.value.key_usage
    customer_master_key_spec = each.value.customer_master_key_spec
    policy = each.value.policy
    deletion_window_in_days = each.value.deletion_window_in_days
    is_enabled = each.value.is_enabled
    enable_key_rotation = each.value.enable_key_rotation
    tags = each.value.tags
}