resource "aws_cloudwatch_dashboard" "dashboard" {
  for_each = var.dashboard

  dashboard_name = each.value.dashboard_name
  dashboard_body = each.value.dashboard_body

}
