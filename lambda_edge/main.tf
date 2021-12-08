resource "aws_lambda_function" "lambda_edge" {
  filename = var.lambda_function_filename

  function_name = var.lambda_function_name
  role = var.lambda_function_iam_role
  handler = var.lambda_function_handler

  runtime = var.lambda_function_runtime
  publish = var.lambda_function_publish
  timeout = var.lambda_function_timeout
  memory_size = var.lambda_function_memory_size
}


