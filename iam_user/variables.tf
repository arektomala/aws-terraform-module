variable "iam_user" {
  description = "IAM user"
  type = map(object({
    name = string
    path = string
    permissions_boundary = string
    force_destroy = bool
    tags = map(string)
  }))
}