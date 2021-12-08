variable "iam_user_policy_attachment" {
  description = "IAM user policy attachment"
  type = map(object({
    user = string
    policy_arn = string
  }))
}