variable  "ami" {
  description = "Get AMI id"
  type = map(object({
    owners = list(string)
    most_recent = bool
    executable_users = list(string)
    filter = list(object({
      name = string
      values = list(string)
    }))
    name_regex = string
  }))
}