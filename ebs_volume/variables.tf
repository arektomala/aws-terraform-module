variable "ebs_volume" {
  description = "EBS volume"
  type = map(object({
    availability_zone = string
    encrypted = bool
    iops = number
    multi_attach_enabled = bool
    size = number
    snapshot_id = string
    outpost_arn = string
    type = string
    kms_key_id = string
    tags = map(string)
    throughput = number
  }))
}