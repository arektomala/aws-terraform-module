resource "aws_ses_domain_identity_verification" "ses_domain_identity_verification" {
  for_each = var.ses_domain_identity_verification

  domain = each.value.domain

  dynamic "timeouts" {
    for_each = each.value.timeouts[*]
    content {
      create = timeouts.value.create
    }
  }
}