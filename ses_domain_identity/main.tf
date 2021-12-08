resource "aws_ses_domain_identity" "ses_domain_identity" {
  for_each = var.ses_domain_identity

  domain = each.value.domain
}