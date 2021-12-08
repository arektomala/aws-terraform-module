variable "rds" {
  description = "RDS instance"
  type = map(object({
    allocated_storage = number
    allow_major_version_upgrade = bool
    apply_immediately = bool
    auto_minor_version_upgrade = bool
    availability_zone = string
    backup_retention_period = number
    backup_window = string
    ca_cert_identifier = string
    character_set_name = string
    copy_tags_to_snapshot = bool
    db_subnet_group_name = string
    delete_automated_backups = bool
    deletion_protection = bool
    domain = string
    domain_iam_role_name = string
    enabled_cloudwatch_logs_exports = list(string)
    engine = string
    engine_version = string
    final_snapshot_identifier = string
    iam_database_authentication_enabled = string
    identifier = string
    identifier_prefix = string
    instance_class = string
    iops = string
    kms_key_id = string
    license_model = string
    maintenance_window = string
    max_allocated_storage = number
    monitoring_interval = number
    monitoring_role_arn = string
    multi_az = bool
    name = string
    option_group_name = string
    parameter_group_name = string
    password = string
    performance_insights_enabled = bool
    performance_insights_kms_key_id = string
    performance_insights_retention_period = number
    port = number
    publicly_accessible = bool
    replicate_source_db = string
    restore_to_point_in_time = object({
      restore_time = string
      source_db_instance_identifier = string
      source_dbi_resource_id = string
      use_latest_restorable_time = bool
    })
    s3_import = object({
      bucket_name = string
      bucket_prefix = string
      ingestion_role = string
      source_engine = string
      source_engine_version = string
    })
    security_group_names = list(string)
    skip_final_snapshot = bool
    snapshot_identifier = string
    storage_encrypted = bool
    storage_type = string
    tags = map(string)
    timeouts = object({
      create = string
      update = string
      delete = string
    })
    timezone = string
    username = string
    vpc_security_group_ids = list(string)
  }))
  default = {
    1 = {
      allocated_storage = 20
      allow_major_version_upgrade = false
      apply_immediately = false
      auto_minor_version_upgrade = true
      availability_zone = null
      // availability_zone = element(var.azs, 0)
      backup_retention_period = 7
      backup_window = "02:00-03:00"
      ca_cert_identifier = null
      character_set_name = null
      copy_tags_to_snapshot = false
      db_subnet_group_name = null
      // db_subnet_group_name =module.rdssg.output_rdssg_aws_db_subnet_group_name
      delete_automated_backups = false
      deletion_protection = false
      domain = null
      domain_iam_role_name = null
      enabled_cloudwatch_logs_exports = []
      engine = "postgres"
      engine_version = "10"
      final_snapshot_identifier = null
      // final_snapshot_identifier = "${var.main_project_name}-final-snapshot-${md5(formatdate("YYYYMMDD-HHmm", timestamp()))}"
      iam_database_authentication_enabled = null
      identifier = null
      // identifier = "${var.main_project_name}-rds"
      identifier_prefix = null
      instance_class = "db.t3.small"
      iops = null
      kms_key_id = null
      license_model = null
      maintenance_window = "Sun:04:00-Sun:06:00"
      max_allocated_storage = 100
      monitoring_interval = 0
      monitoring_role_arn = null
      multi_az = false
      name = "postgres"
      option_group_name = null
      parameter_group_name = null
      password = "CHANGE-ME"
      performance_insights_enabled = false
      performance_insights_kms_key_id = null
      performance_insights_retention_period = 0
      port = 5432
      publicly_accessible = false
      replicate_source_db = null
      restore_to_point_in_time = {
        restore_time = null
        source_db_instance_identifier = null
        source_dbi_resource_id = null
        use_latest_restorable_time = false
      }
      s3_import = {
        bucket_name = null
        bucket_prefix = null
        ingestion_role = null
        source_engine = null
        source_engine_version = null
      }
      security_group_names = []
      skip_final_snapshot = false
      snapshot_identifier = null
      storage_encrypted = true
      storage_type = "gp2"
      tags = {
        "Name":"DEFAULT-rds-postgres",
        "cost-allocation":"DEFAULT-cost-allocation",
        "cost-allocation-env":"DEFAULT-cost-allocation-env"
      }
      timeouts = {
        create = "40m"
        update = "40m"
        delete = "40m"
      }
      timezone = null
      username = "sj3develop"
      vpc_security_group_ids = []
      // vpc_security_group_ids = [module.security_group_private_only_local.output_sg_aws_security_group_id]
    }
  }
}