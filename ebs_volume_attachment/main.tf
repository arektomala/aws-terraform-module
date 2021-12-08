resource "aws_volume_attachment" "ebs_volume_attachment" {
  for_each = var.ebs_volume_attachment

  device_name = each.value.device_name
  instance_id = each.value.instance_id
  volume_id = each.value.volume_id
  force_detach = each.value.force_detach
  skip_destroy = each.value.skip_destroy
}