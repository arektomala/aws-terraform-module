output "output_aws_lambda_arn" {
  value = aws_lambda_function.lambda_edge.arn
}

output "output_aws_lambda_qualified_arn" {
  value = aws_lambda_function.lambda_edge.qualified_arn
}


output "output_aws_lambda_function_name" {
  value = aws_lambda_function.lambda_edge.function_name
}

