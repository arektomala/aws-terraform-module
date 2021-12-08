resource "aws_lambda_permission" "lambda_permission" {
  for_each = var.lambda_permission

  action = each.value.action
  event_source_token = each.value.event_source_token
  function_name = each.value.function_name
  principal = each.value.principal
  qualifier = each.value.qualifier
  source_account = each.value.source_account
  source_arn = each.value.source_arn
  statement_id = each.value.statement_id
  statement_id_prefix = each.value.statement_id_prefix
}
