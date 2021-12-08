variable "group_policy_attachment" {
  description = "Group policy attachment"
  type = map(object({
    group = string
    policy_arn = string

  }))
}
