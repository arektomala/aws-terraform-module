resource "aws_launch_configuration" "ec2_lc" {
  for_each = var.ec2_lc

  name = each.value.name
  name_prefix = each.value.name_prefix
  image_id = each.value.image_id
  instance_type = each.value.instance_type
  iam_instance_profile = each.value.iam_instance_profile
  key_name = each.value.key_name

  dynamic "metadata_options" {
    for_each = each.value.metadata_options[*]
    content {
      http_endpoint = metadata_options.value.http_endpoint
      http_tokens = metadata_options.value.http_tokens
      http_put_response_hop_limit = metadata_options.value.http_put_response_hop_limit
    }
  }

  security_groups = each.value.security_groups
  associate_public_ip_address = each.value.associate_public_ip_address
  vpc_classic_link_id = each.value.vpc_classic_link_id
  vpc_classic_link_security_groups = each.value.vpc_classic_link_security_groups
  user_data = each.value.user_data
  user_data_base64 = each.value.user_data_base64
  enable_monitoring = each.value.enable_monitoring
  ebs_optimized = each.value.ebs_optimized

  dynamic "root_block_device" {
    for_each = each.value.root_block_device[*]
    content {
      volume_type = root_block_device.value.volume_type
      volume_size = root_block_device.value.volume_size
      iops = root_block_device.value.iops
      delete_on_termination = root_block_device.value.delete_on_termination
      encrypted = root_block_device.value.encrypted
    }
  }

  dynamic "ebs_block_device" {
    for_each = each.value.ebs_block_device[*]
    content {
      device_name = ebs_block_device.value.device_name
      snapshot_id = ebs_block_device.value.snapshot_id
      volume_type = ebs_block_device.value.volume_type
      volume_size = ebs_block_device.value.volume_size
      iops = ebs_block_device.value.iops
      delete_on_termination = ebs_block_device.value.delete_on_termination
      encrypted = ebs_block_device.value.encrypted
      no_device = ebs_block_device.value.no_device
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = each.value.ephemeral_block_device[*]
    content {
      device_name = ephemeral_block_device.value.device_name
      virtual_name = ephemeral_block_device.value.virtual_name
    }
  }

  spot_price = each.value.spot_price
  placement_tenancy = each.value.placement_tenancy

  lifecycle {
    create_before_destroy = true
  }
}