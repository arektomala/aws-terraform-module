resource "aws_s3_bucket_notification" "bucket_notification" {
  for_each = var.bn_bucket_notification

  bucket = each.value.bucket

  dynamic "topic" {
    for_each = each.value.topic[*]
    content {
      id = topic.value.id
      topic_arn = topic.value.topic_arn
      events = topic.value.events
      filter_prefix = topic.value.filter_prefix
      filter_suffix = topic.value.filter_suffix
    }
  }

  dynamic "queue" {
    for_each = each.value.queue[*]
    content {
      id = queue.value.id
      queue_arn = queue.value.queue_arn
      events = queue.value.events
      filter_prefix = queue.value.filter_prefix
      filter_suffix = queue.value.filter_suffix
    }
  }

  dynamic "lambda_function" {
    for_each = each.value.lambda_function[*]
    content {
      id = lambda_function.value.id
      lambda_function_arn = lambda_function.value.lambda_function_arn
      events = lambda_function.value.events
      filter_prefix = lambda_function.value.filter_prefix
      filter_suffix = lambda_function.value.filter_suffix
    }
  }
}
