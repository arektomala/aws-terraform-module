variable "lifecycle_manager" {
  description = "lifecycle_manager"
  type = map(object({
    description = string
    execution_role_arn = string
    policy_details = object({
      resource_types = list(string)
      schedule = list(object({
        copy_tags = bool
        create_rule = object({
          interval = string
          interval_unit = string
          times = list(string)
        })
        name = string
        retain_rule = object({
          count = number
        })
        tags_to_add = map(string)
      }))
      target_tags = map(string)
    })
  }))
}