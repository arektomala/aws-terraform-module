resource "aws_s3_bucket" "bucket" {
  for_each = var.b_aws_s3_buckets
  bucket = each.value.bucket != null ? each.value.bucket : null
  bucket_prefix = each.value.bucket_prefix != null ? each.value.bucket_prefix : null
  acl = each.value.acl != null ? each.value.acl : null

  dynamic "grant" {
    for_each = each.value.grant[*]
    content {
      id = grant.value.id
      type = grant.value.type
      permissions = grant.value.permissions
      uri = grant.value.uri
    }
  }

  policy = each.value.policy
  tags = each.value.tags
  force_destroy = each.value.force_destroy

  dynamic "website" {
    for_each = each.value.website[*]
    content {
      index_document = website.value.index_document
      error_document = website.value.error_document
      redirect_all_requests_to = website.value.redirect_all_requests_to
      routing_rules = website.value.routing_rules
    }
  }

  dynamic "cors_rule" {
    for_each = each.value.cors_rule[*]
    content {
      allowed_headers = cors_rule.value.allowed_headers
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers = cors_rule.value.expose_headers
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }

  dynamic "versioning" {
    for_each = each.value.versioning[*]
    content {
      enabled = versioning.value.enabled
      mfa_delete = versioning.value.mfa_delete
    }
  }

  dynamic "logging" {
    for_each = each.value.logging[*]
    content {
        target_bucket = logging.value.target_bucket
        target_prefix = logging.value.target_prefix
      }
  }

  dynamic "lifecycle_rule" {
    for_each = each.value.lifecycle_rule[*]
    content {
      id = lifecycle_rule.value.id
      prefix = lifecycle_rule.value.prefix
      enabled = lifecycle_rule.value.enabled
      abort_incomplete_multipart_upload_days = lifecycle_rule.value.abort_incomplete_multipart_upload_days

      dynamic "expiration" {
        for_each = lifecycle_rule.value.expiration[*]
        content {
          date = expiration.value.date
          days = expiration.value.days
          expired_object_delete_marker = expiration.value.expired_object_delete_marker
        }
      }

      dynamic "transition" {
        for_each = lifecycle_rule.value.transition[*]
        content {
          date = transition.value.date
          days = transition.value.days
          storage_class = transition.value.storage_class
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = lifecycle_rule.value.noncurrent_version_expiration[*]
        content {
          days = noncurrent_version_expiration.value.days
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = lifecycle_rule.value.noncurrent_version_transition[*]
        content {
          days = noncurrent_version_transition.value.days
          storage_class = noncurrent_version_transition.value.storage_class
        }
      }
    }
  }

  acceleration_status = each.value.acceleration_status
  request_payer = each.value.request_payer

  dynamic "replication_configuration" {
    for_each = each.value.replication_configuration[*]
    content {
      role = replication_configuration.value.role

      dynamic "rules" {
        for_each = replication_configuration.value.rules[*]
        content {
          id = replication_configuration.value.id
          priority = replication_configuration.value.priority

          dynamic "destination" {
            for_each = replication_configuration.value.destination[*]
            content {
              bucket = destination.value.bucket
              storage_class = destination.value.storage_class
              replica_kms_key_id = destination.value.replica_kms_key_id

              dynamic "access_control_translation" {
                for_each = destination.value.access_control_translation[*]
                content {
                  owner = access_control_translation.value.owner
                }
              }
              account_id = destination.value.account_id
            }
          }

          dynamic "source_selection_criteria" {
            for_each = replication_configuration.value.source_selection_criteria[*]
            content {

              dynamic "sse_kms_encrypted_objects" {
                for_each = source_selection_criteria.value.sse_ks_encrypted_objects
                content {
                  enabled = sse_kms_encrypted_objects.value.enabled
                }
              }
            }
          }
          prefix = replication_configuration.value.prefix
          status = replication_configuration.value.status

          dynamic "filter" {
            for_each = replication_configuration.value.filter[*]
            content {
              prefix = filter.value.prefix
              tags = filter.value.tags
            }
          }
        }
      }
    }
  }

  dynamic "server_side_encryption_configuration" {
    for_each = each.value.server_side_encryption_configuration[*]
    content {

      dynamic "rule" {
        for_each = server_side_encryption_configuration.value.rule[*]
        content {

          dynamic "apply_server_side_encryption_by_default" {
            for_each = rule.value.apply_server_side_encryption_by_default[*]
            content {
              sse_algorithm = apply_server_side_encryption_by_default.value.sse_algorithm
              kms_master_key_id = apply_server_side_encryption_by_default.value.kms_master_key_id
            }
          }
        }
      }
    }
  }

  dynamic "object_lock_configuration" {
    for_each = each.value.object_lock_configuration[*]
    content {
      object_lock_enabled = object_lock_configuration.value.object_lock_enabled

      dynamic "rule" {
        for_each = object_lock_configuration.value.rule[*]
        content {

          dynamic "default_retention" {
            for_each = rule.value.default_retention[*]
            content {
              mode = default_retention.value.mode
              days = default_retention.value.days
              years = default_retention.value.years
            }
          }
        }
      }
    }
  }
}
