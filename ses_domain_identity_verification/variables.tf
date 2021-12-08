variable "ses_domain_identity_verification" {
  description = "SES domain identity verification"
  type = map(object({
    domain = string
    timeouts = object({
      create = string
    })
  }))
}