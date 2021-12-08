# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm

variable "cloudwatch_metric_alarm" {
  type = map(object({
    alarm_name = string
    comparison_operator = string
    evaluation_periods = number
    metric_name = string
    namespace = string
    period = number
    statistic = string
    threshold = number
    threshold_metric_id = string
    actions_enabled = bool
    alarm_actions = list(string)
    alarm_description = string
    datapoints_to_alarm = number
    dimensions = map(string)
    insufficient_data_actions = list(string)
    ok_actions = list(string)
    unit = string
    extended_statistic = number
    treat_missing_data = string
    evaluate_low_sample_count_percentiles = string
    metric_query = object({
      id = string
      account_id = string
      expression = string
      label = string
      return_data = bool
      metric = object({
        dimensions = string
        metric_name = string
        namespace = string
        period = string
        stat = string
        unit = string
      })
    })
    tags = map(string)

  }))
}
