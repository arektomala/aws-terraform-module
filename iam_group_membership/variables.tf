variable "group_membership" {
  description = "Group membership"
  type = map(object({
    name = string
    users = list(string)
    group = string
  }))
}
