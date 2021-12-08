resource "aws_instance" "instance" {
  for_each = var.instance

  ami = each.value.ami
  availability_zone = each.value.availability_zone
  placement_group = each.value.placement_group
  tenancy = each.value.tenancy
  host_id = each.value.host_id
  cpu_core_count = each.value.cpu_core_count
  cpu_threads_per_core = each.value.cpu_threads_per_core
  ebs_optimized = each.value.ebs_optimized
  disable_api_termination = each.value.disable_api_termination
  instance_initiated_shutdown_behavior = each.value.instance_initiated_shutdown_behavior
  instance_type = each.value.instance_type
  key_name = each.value.key_name
  get_password_data = each.value.get_password_data
  monitoring = each.value.monitoring
  security_groups = each.value.security_groups
  vpc_security_group_ids = each.value.vpc_security_group_ids
  subnet_id = each.value.subnet_id
  associate_public_ip_address = each.value.associate_public_ip_address
  private_ip = each.value.private_ip
  secondary_private_ips = each.value.secondary_private_ips
  source_dest_check = each.value.source_dest_check
  user_data = each.value.user_data
  user_data_base64 = each.value.user_data_base64
  iam_instance_profile = each.value.iam_instance_profile
  ipv6_address_count = each.value.ipv6_address_count
  ipv6_addresses = each.value.ipv6_addresses
  tags = each.value.tags
  volume_tags = each.value.volume_tags

  dynamic "root_block_device" {
    for_each = each.value.root_block_device[*]
    content {
      volume_type = root_block_device.value.volume_type
      volume_size = root_block_device.value.volume_size
      iops = root_block_device.value.iops
      delete_on_termination = root_block_device.value.delete_on_termination
      encrypted = root_block_device.value.encrypted
      kms_key_id = root_block_device.value.kms_key_id
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
      kms_key_id = ebs_block_device.value.kms_key_id
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = each.value.ephemeral_block_device[*]
    content {
      device_name = ephemeral_block_device.value.device_name
      virtual_name = ephemeral_block_device.value.virtual_name
      no_device = ephemeral_block_device.value.no_device
    }
  }

  dynamic "network_interface" {
    for_each = each.value.network_interface[*]
    content {
      device_index = network_interface.value.device_index
      network_interface_id = network_interface.value.network_interface_id
      delete_on_termination = network_interface.value.delete_on_termination
    }
  }

  dynamic "credit_specification" {
    for_each = each.value.credit_specification[*]
    content {
      cpu_credits = credit_specification.value.cpu_credits
    }
  }

  hibernation = each.value.hibernation

  dynamic "metadata_options" {
    for_each = each.value.metadata_options[*]
    content {
      http_endpoint = metadata_options.value.http_endpoint
      http_tokens = metadata_options.value.http_tokens
      http_put_response_hop_limit = metadata_options.value.http_put_response_hop_limit
    }
  }
}
