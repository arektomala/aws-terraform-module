variable "lambda_function_filename" {
  description = "Name od a file containing lambda function"
  type = string
}

variable "lambda_function_name" {
  type = string
}

variable "lambda_function_handler" {
  type = string
}

variable "lambda_function_iam_role" {
  type = string
  description = "IAM role with privilegees required by the Lambda function"
}

variable "lambda_function_runtime" {
  type = string
  description = "Runtime used to run the Lambda function"
}

variable "lambda_function_publish" {
  type = bool
  description = "Boolean that specifies if function should be published"
  default = false
}

variable "lambda_function_timeout" {
  type = number
  default = 5
}

variable "lambda_function_memory_size" {
  type = number
  default = 128
}
