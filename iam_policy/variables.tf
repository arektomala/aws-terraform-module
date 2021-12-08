variable "iam_policy" {
  description = "IAM policy"
  type = map(object({
    description = string
    name = string
    name_prefix = string
    path = string
    policy = string
  }))
}
