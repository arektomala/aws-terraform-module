variable "cf_cloudfront" {
  description = "Bucket important values"
  type = map(object({
    aliases = list(string)
    comment = string
    custom_error_response = list(object({
      error_caching_min_ttl = number
      error_code = string
      response_code = string
      response_page_path = string
    }))
    default_cache_behavior = object({
      allowed_methods = list(string)
      cached_methods = list(string)
      compress = bool
      default_ttl = number
      field_level_encryption_id = string
      forwarded_values = object({
        cookies = object({
          forward = string
          whitelisted_names = set(string)
        })
        headers = set(string)
        query_string = bool
        query_string_cache_keys = list(string)
      })
      lambda_function_association = list(object({
        event_type = string
        lambda_arn = string
        include_body = bool
      }))
      max_ttl = number
      min_ttl = number
      smooth_streaming = bool
      target_origin_id = string
      trusted_signers = list(string)
      viewer_protocol_policy = string
    })
    default_root_object = string
    enabled = bool
    is_ipv6_enabled = bool
    http_version = string
    logging_config = object({
      bucket = string
      include_cookies = bool
      prefix = string
    })
    ordered_cache_behavior = object({
      allowed_methods = list(string)
      cached_methods = list(string)
      compress = bool
      default_ttl = number
      field_level_encryption_id = string
      forwarded_values = object({
        cookies = object({
          forward = string
          whitelisted_names = set(string)
        })
        headers = set(string)
        query_string = bool
        query_string_cache_keys = list(string)
      })
      lambda_function_association = list(object({
        event_type = string
        lambda_arn = string
        include_body = bool
      }))
      max_ttl = number
      min_ttl = number
      path_pattern = string
      smooth_streaming = bool
      target_origin_id = string
      trusted_signers = list(string)
      viewer_protocol_policy = string
    })
    origin = object({
      custom_origin_config = object({
        http_port = string
        https_port = string
        origin_protocol_policy = string
        origin_ssl_protocols = list(string)
        origin_keepalive_timeout = string
        origin_read_timeout = string
      })
      domain_name = string
      custom_header = map(object({
        name = string
        value = string
      }))
      origin_id = string
      origin_path = string
      s3_origin_config = object({
        origin_access_identity = string
      })
    })
    origin_group = object({
      origin_id = string
      failover_criteria = object({
        status_codes = string
      })
      member = object({
        origin_id = string
      })
    })
    price_class = string
    restrictions = object({
      geo_restriction = object({
        restriction_type = string
        locations = list(string)
      })
    })
    tags = map(string)
    viewer_certificate = object({
      acm_certificate_arn = string
      cloudfront_default_certificate = bool
      iam_certificate_id = string
      minimum_protocol_version = string
      ssl_support_method = string
    })
    web_acl_id = string
    retain_on_delete = bool
    wait_for_deployment = bool
  }))
}
