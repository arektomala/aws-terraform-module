variable "iam_role" {
  description = "IAM role"
  type = map(object({
    assume_role_policy = string
    description = string
    force_detach_policies = bool
    inline_policy = object({
      name = string
      policy = string
    })
    managed_policy_arns = list(string)
    max_session_duration = number
    name = string
    name_prefix = string
    path = string
    permissions_boundary = string
    tags = map(string)
  }))
}
