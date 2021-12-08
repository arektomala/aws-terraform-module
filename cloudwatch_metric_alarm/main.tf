resource "aws_cloudwatch_metric_alarm" "metric_alarm" {
  for_each = var.cloudwatch_metric_alarm

  alarm_name = each.value.alarm_name
  comparison_operator = each.value.comparison_operator
  evaluation_periods = each.value.evaluation_periods
  metric_name = each.value.metric_name
  namespace = each.value.namespace
  period = each.value.period
  statistic = each.value.statistic
  threshold = each.value.threshold
  threshold_metric_id = each.value.threshold_metric_id
  actions_enabled = each.value.actions_enabled
  alarm_actions = each.value.alarm_actions
  alarm_description = each.value.alarm_description
  datapoints_to_alarm = each.value.datapoints_to_alarm
  dimensions = each.value.dimensions
  insufficient_data_actions = each.value.insufficient_data_actions
  ok_actions = each.value.ok_actions
  unit = each.value.unit
  extended_statistic = each.value.extended_statistic
  treat_missing_data = each.value.treat_missing_data
  evaluate_low_sample_count_percentiles = each.value.evaluate_low_sample_count_percentiles

  dynamic "metric_query" {
    for_each = each.value.metric_query[*]
    content {
      id = metric_query.value.id
      account_id = metric_query.value.account_id
      expression = metric_query.value.expression
      label = metric_query.value.label
      return_data = metric_query.value.return_data

      dynamic "metric" {
        for_each = metric_query.value.metric[*]
        content {
          dimensions = metric.value.dimensions
          metric_name = metric.value.metric_name
          namespace = metric.value.namespace
          period = metric.value.period
          stat = metric.value.stat
          unit = metric.value.unit
        }
      }
    }
  }
  tags = each.value.tags

}
