resource "aws_sqs_queue_policy" "sqs_policy" {
  for_each = var.sqs-policy

  policy = each.value.policy
  queue_url = each.value.queue_url
}