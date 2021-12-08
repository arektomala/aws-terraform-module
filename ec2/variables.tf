variable "instance" {
  description = "Instance"
  type = map(object({
    ami = string
    availability_zone = string
    placement_group = string
    tenancy = string
    host_id = string
    cpu_core_count = number
    cpu_threads_per_core = number
    ebs_optimized = bool
    disable_api_termination = bool
    instance_initiated_shutdown_behavior = string
    instance_type = string
    key_name = string
    get_password_data = bool
    monitoring = bool
    security_groups = list(string)
    vpc_security_group_ids = list(string)
    subnet_id = string
    associate_public_ip_address = bool
    private_ip = string
    secondary_private_ips = list(string)
    source_dest_check = bool
    user_data = string
    user_data_base64 = string
    iam_instance_profile = string
    ipv6_address_count = number
    ipv6_addresses = list(string)
    tags = map(string)
    volume_tags = map(string)
    root_block_device = object({
      volume_type = string
      volume_size = number
      iops = number
      delete_on_termination = bool
      encrypted = bool
      kms_key_id = string
    })
    ebs_block_device = object({
      device_name = string
      snapshot_id = string
      volume_type = string
      volume_size = number
      iops = number
      delete_on_termination = bool
      encrypted = bool
      kms_key_id = string
    })
    ephemeral_block_device = object({
      device_name = string
      virtual_name = string
      no_device = string
    })
    network_interface = object({
      device_index = string
      network_interface_id = string
      delete_on_termination = string
    })
    credit_specification = object({
      cpu_credits = string
    })
    hibernation = bool
    metadata_options = object({
      http_endpoint = string
      http_tokens = string
      http_put_response_hop_limit = string
    })
  }))
  default = {
    1 = {
      ami = null
      availability_zone = null
      placement_group = null
      tenancy = null
      host_id = null
      cpu_core_count = null
      cpu_threads_per_core = null
      ebs_optimized = true
      disable_api_termination = true
      instance_initiated_shutdown_behavior = "stop"
      instance_type = "t3a.micro"
      key_name = null
      get_password_data = false
      monitoring = true
      security_groups = null
      vpc_security_group_ids = null
      subnet_id = null
      associate_public_ip_address = false
      private_ip = null
      secondary_private_ips = null
      source_dest_check = true
      user_data = null
      user_data_base64 = null
      iam_instance_profile = null
      ipv6_address_count = 0
      ipv6_addresses = null
      tags = {
        "Name":"EC2-default-name"
      }
      volume_tags = null
      root_block_device = {
        volume_type = "gp2"
        volume_size = 8
        iops = null
        delete_on_termination = true
        encrypted = false
        kms_key_id = null
      }
      ebs_block_device = null
      ephemeral_block_device = null
      network_interface = null
      credit_specification = null
      hibernation = false
      metadata_options = null
    }
  }
}
