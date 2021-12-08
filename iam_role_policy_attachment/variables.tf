variable "iam_role_policy_attachment" {
  description = "IAM role policy attachment"
  type = map(object({
    role = string
    policy_arn = string
  }))
}