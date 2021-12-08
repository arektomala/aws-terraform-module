variable "iam_instance_profile" {
  description = "IAM instance profile"
  type = map(object({
    name = string
    name_prefix = string
    path = string
    role = string
  }))
}
