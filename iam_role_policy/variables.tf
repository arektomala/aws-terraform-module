variable "iam_role_policy" {
  description = "IAM role policy"
  type = map(object({
    name = string
    name_prefix = string
    policy = string
    role = string
  }))
}