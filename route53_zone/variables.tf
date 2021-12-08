variable "r53_zone" {
  description = "Route53 zone"
  type = map(object({
    name = string
    comment = string
    delegation_set_id = string
    force_destroy = bool
    tags = map(string)
    vpc = object({
      vpc_id = string
      vpc_region = string
    })
  }))
}