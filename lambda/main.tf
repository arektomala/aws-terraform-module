resource "aws_lambda_function" "lambda" {
  for_each = var.lambda
  function_name = each.value.function_name
  role = each.value.role
  code_signing_config_arn = each.value.code_signing_config_arn
  dynamic "dead_letter_config" {
    for_each = each.value.dead_letter_config[*]
    content {
      target_arn = dead_letter_config.value.target_arn
    }
  }
  description = each.value.description
  dynamic "environment" {
    for_each = each.value.environment[*]
    content {
      variables = environment.value.variables
    }
  }
  dynamic "file_system_config" {
    for_each = each.value.file_system_config[*]
    content {
      arn = file_system_config.value.arn
      local_mount_path = file_system_config.value.local_mount_path
    }
  }
  filename = each.value.filename
  handler = each.value.handler
  dynamic "image_config" {
    for_each = each.value.image_config[*]
    content {
      command = image_config.value.command
      entry_point = image_config.value.entry_point
      working_directory = image_config.value.working_directory
    }
  }
  image_uri = each.value.image_uri
  kms_key_arn = each.value.kms_key_arn
  //layers = each.value.layers
  memory_size = each.value.memory_size
  package_type = each.value.package_type
  publish = each.value.publish
  reserved_concurrent_executions = each.value.reserved_concurrent_executions
  runtime = each.value.runtime
  s3_bucket = each.value.s3_bucket
  s3_key = each.value.s3_key
  s3_object_version = each.value.s3_object_version
  source_code_hash = each.value.source_code_hash
  tags = each.value.tags
  timeout = each.value.timeout
  dynamic "tracing_config" {
    for_each = each.value.tracing_config[*]
    content {
      mode = tracing_config.value.mode
    }
  }
  /* dynamic "vpc_config" {
     for_each = each.value.vpc_config
     content {
       security_group_ids = vpc_config.value.security_group_ids
       subnet_ids = vpc_config.value.subnet_ids
     }
   }*/
}
