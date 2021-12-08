resource "aws_ebs_volume" "ebs_volume" {
  for_each = var.ebs_volume

  availability_zone = each.value.availability_zone
  encrypted = each.value.encrypted
  iops = each.value.iops
  multi_attach_enabled = each.value.multi_attach_enabled
  size = each.value.size
  snapshot_id = each.value.snapshot_id
  outpost_arn = each.value.outpost_arn
  type = each.value.type
  kms_key_id = each.value.kms_key_id
  tags = each.value.tags
  throughput = each.value.throughput
}