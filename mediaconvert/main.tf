resource "aws_media_convert_queue" "mediaconvert" {

  for_each = var.mediaconvert

  name = each.value.name
  description = each.value.description
  pricing_plan = each.value.pricing_plan
  dynamic "reservation_plan_settings"  {
    for_each = each.value.reservation_plan_settings[*]
    content {
      commitment = reservation_plan_settings.value.commitment
      renewal_type = reservation_plan_settings.value.renewal_type
      reserved_slots = reservation_plan_settings.value.reserved_slots
    }
  }
  status = each.value.status
  tags = each.value.tags
}
