variable "iam_user_policy" {
  description = "IAM user policy"
  type = map(object({
    policy = string
    name = string
    name_prefix = string
    user = string
  }))
}