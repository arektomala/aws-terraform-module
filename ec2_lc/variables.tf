variable "ec2_lc" {
  description = "ASG launch configuration"
  type = map(object({
    name = string
    name_prefix = string
    image_id = string
    instance_type = string
    iam_instance_profile = string
    key_name = string
    metadata_options = object({
      http_endpoint = string
      http_tokens = string
      http_put_response_hop_limit = string
    })
    security_groups = list(string)
    associate_public_ip_address = bool
    vpc_classic_link_id = string
    vpc_classic_link_security_groups = list(string)
    user_data = string
    user_data_base64 = string
    enable_monitoring = bool
    ebs_optimized = bool
    root_block_device = object({
      volume_type = string
      volume_size = number
      iops = number
      delete_on_termination = bool
      encrypted = bool
    })
    ebs_block_device = object({
      device_name = string
      snapshot_id = string
      volume_type = string
      volume_size = number
      iops = number
      delete_on_termination = bool
      encrypted = bool
      no_device = string
    })
    ephemeral_block_device = object({
      device_name = string
      virtual_name = string
    })
    spot_price = string
    placement_tenancy = string
  }))
}