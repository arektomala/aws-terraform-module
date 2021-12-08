variable "iam_access_key" {
  description = "IAM access key"
  type = map(object({
    user = string
    pgp_key = string
    status = string
  }))
}