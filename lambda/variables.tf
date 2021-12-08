variable "lambda" {
  description = "lambda"
  type = map(object({
    function_name = string
    role = string
    code_signing_config_arn = string
    dead_letter_config = object({
      target_arn = string
    })
    description = string
    environment = object({
      variables = map(string)
    })
    file_system_config = object({
      arn = string
      local_mount_path = string
    })
    filename = string
    handler = string
    image_config = object({
      command = string
      entry_point = string
      working_directory = string
    })
    image_uri = string
    kms_key_arn = string
    //layers = string
    memory_size = number
    package_type = string
    publish = bool
    reserved_concurrent_executions = string
    runtime = string
    s3_bucket = string
    s3_key = string
    s3_object_version = string
    source_code_hash = string
    tags = map(string)
    timeout = string
    tracing_config = object({
      mode = string
    })
    //vpc_config = object({
    //  security_group_ids = list(string)
    //  subnet_ids = list(string)
    //})
  }))
}
