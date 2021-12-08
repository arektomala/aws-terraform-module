variable "b_aws_s3_buckets" {
  description = "Bucket important values"
  type = map(object({
    bucket = string
    bucket_prefix = string
    acl = string
    grant = object({
      id = string
      type = string
      permissions = string
      uri = string
    })
    policy = string
    tags = map(string)
    force_destroy = bool
    website = object({
      index_document = string
      error_document = string
      redirect_all_requests_to = string
      routing_rules = string
    })
    cors_rule = object({
      allowed_headers = tuple([string])
      allowed_methods = tuple([string, string, string, string])
      allowed_origins = tuple([string])
      expose_headers = tuple([string])
      max_age_seconds = number
    })
    versioning = object({
      enabled = bool
      mfa_delete = bool
    })
    logging = object({
      target_bucket = string
      target_prefix = string
    })
    lifecycle_rule = object({
      id = string
      prefix = string
      enabled = bool
      abort_incomplete_multipart_upload_days = number
      expiration = object({
        date = string
        days = number
        expired_object_delete_marker = string
      })
      transition = object({
        date = string
        days = number
        storage_class = string
      })
      noncurrent_version_expiration = object({
        days = number
      })
      noncurrent_version_transition = object({
        days = number
        storage_class = string
      })
    })
    acceleration_status = string
    request_payer = string
    replication_configuration = object({
      role = string
      rules = object({
        id = string
        priority = number
        destination = object({
          bucket = string
          storage_class = string
          replica_kms_key_id = string
          access_control_translation = object({
            owner = string
          })
          account_id = string
        })
        source_selection_criteria = object({
          sse_kms_encrypted_objects = object({
            enabled = bool
          })
        })
        prefix = string
        status = string
        filter = object({
          prefix = string
          tags = map(string)
        })
      })
    })
    server_side_encryption_configuration = object({
      rule = object({
        apply_server_side_encryption_by_default = object({
          sse_algorithm = string
          kms_master_key_id = string
        })
      })
    })
    object_lock_configuration = object({
      object_lock_enabled = string
      rule = object({
        default_retention = object({
          mode = string
          days = number
          years = number
        })
      })
    })
  }))
}
