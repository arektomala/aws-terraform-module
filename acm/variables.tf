variable "acm_certificate" {
  type = map(object({
    domain_name = string
    subject_alternative_names = list(string)
    validation_method = string
    options = object({
      certificate_transparency_logging_preference = string
    })
    tags = map(string)
  }))
}