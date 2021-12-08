resource "aws_db_instance" "db" { 
  for_each = var.rds

  allocated_storage = each.value.allocated_storage
  allow_major_version_upgrade = each.value.allow_major_version_upgrade
  apply_immediately = each.value.apply_immediately
  auto_minor_version_upgrade = each.value.auto_minor_version_upgrade
  availability_zone = each.value.availability_zone
  backup_retention_period = each.value.backup_retention_period
  backup_window = each.value.backup_window
  ca_cert_identifier = each.value.ca_cert_identifier
  character_set_name = each.value.character_set_name
  copy_tags_to_snapshot = each.value.copy_tags_to_snapshot
  db_subnet_group_name = each.value.db_subnet_group_name
  delete_automated_backups = each.value.delete_automated_backups
  deletion_protection = each.value.deletion_protection
  domain = each.value.domain
  domain_iam_role_name = each.value.domain_iam_role_name
  enabled_cloudwatch_logs_exports = each.value.enabled_cloudwatch_logs_exports
  engine = each.value.engine
  engine_version = each.value.engine_version
  final_snapshot_identifier = each.value.final_snapshot_identifier
  iam_database_authentication_enabled = each.value.iam_database_authentication_enabled
  identifier = each.value.identifier
  identifier_prefix = each.value.identifier_prefix
  instance_class = each.value.instance_class
  iops = each.value.iops
  kms_key_id = each.value.kms_key_id
  license_model = each.value.license_model
  maintenance_window = each.value.maintenance_window
  max_allocated_storage = each.value.max_allocated_storage
  monitoring_interval = each.value.monitoring_interval
  monitoring_role_arn = each.value.monitoring_role_arn
  multi_az = each.value.multi_az
  name = each.value.name
  option_group_name = each.value.option_group_name
  parameter_group_name = each.value.parameter_group_name
  password = each.value.password
  performance_insights_enabled = each.value.performance_insights_enabled
  performance_insights_kms_key_id = each.value.performance_insights_kms_key_id
  performance_insights_retention_period = each.value.performance_insights_retention_period
  port = each.value.port
  publicly_accessible = each.value.publicly_accessible
  replicate_source_db = each.value.replicate_source_db

  dynamic "restore_to_point_in_time" {
    for_each = each.value.restore_to_point_in_time[*]
    content {
      restore_time = restore_to_point_in_time.value.restore_time
      source_db_instance_identifier = restore_to_point_in_time.value.source_db_instance_identifier
      source_dbi_resource_id = restore_to_point_in_time.value.source_dbi_resource_id
      use_latest_restorable_time = restore_to_point_in_time.value.use_latest_restorable_time
    }
  }

  dynamic "s3_import" {
    for_each = each.value.s3_import[*]
    content {
      bucket_name = s3_import.value.bucket_name
      bucket_prefix = s3_import.value.bucket_prefix
      ingestion_role = s3_import.value.ingestion_role
      source_engine = s3_import.value.sourec_engine
      source_engine_version = s3_import.value.source_engine_version
    }
  }

  security_group_names = each.value.security_group_names
  skip_final_snapshot = each.value.skip_final_snapshot
  snapshot_identifier = each.value.snapshot_identifier
  storage_encrypted = each.value.storage_encrypted
  storage_type = each.value.storage_type
  tags = each.value.tags

  dynamic "timeouts" {
    for_each = each.value.timeouts[*]
    content {
      create = timeouts.value.create
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
  timezone = each.value.timezone
  username = each.value.username
  vpc_security_group_ids = each.value.vpc_security_group_ids

  lifecycle {
    ignore_changes = [final_snapshot_identifier,kms_key_id]
  }
}

