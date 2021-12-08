variable "ses_domain_identity" {
  description = "SES domain identity"
  type = map(object({
    domain = string
  }))
}