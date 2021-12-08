variable "iam_group" {
  description = "IAM Group"
  type = map(object({
    name = string
    path = string
  }))
}