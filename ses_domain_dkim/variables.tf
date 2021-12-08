variable "ses_domain_dkim" {
  description = "SES domain dkim"
  type = map(object({
    domain = string
  }))
}