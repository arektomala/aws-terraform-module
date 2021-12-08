variable "ebs_volume_attachment" {
  description = "EBS volume attachment"
  type = map(object({
    device_name = string
    instance_id = string
    volume_id = string
    force_detach = bool
    skip_destroy = bool
  }))
}