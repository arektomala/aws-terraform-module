resource "aws_acm_certificate" "acm_certificate" {
  for_each = var.acm_certificate

  domain_name = each.value.domain_name
  subject_alternative_names = each.value.subject_alternative_names
  validation_method = each.value.validation_method

  dynamic "options" {
    for_each = each.value.options[*]
    content {
      certificate_transparency_logging_preference = options.value.certificate_transparency_logging_preference
    }
  }

  tags = each.value.tags

  lifecycle {
    create_before_destroy = true
  }

}
