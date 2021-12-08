resource "aws_ses_domain_dkim" "ses_domain_dkim" {
  for_each = var.ses_domain_dkim

  domain = each.value.domain
}