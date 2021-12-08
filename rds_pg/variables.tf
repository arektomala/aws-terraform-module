variable "rds_pg" {
  description = "RDS parameter_group"
  type = map(object({
    name = string
    name_prefix = string
    family = string
    description = string
      parameter = list(object({
        name = string
        value = string
        apply_method = string      //"immediate" (default), or "pending-reboot". Some engines can't apply some parameters without a reboot, and you will need to specify "pending-reboot" here.
      }))
    tags = map(string)
  }))
}