resource "aws_mq_broker" "mq" {
  
  for_each = var.mq
  
  apply_immediately = each.value.apply_immediately
  auto_minor_version_upgrade = each.value.auto_minor_version_upgrade
  broker_name = each.value.broker_name
  dynamic "configuration"  {
      for_each = each.value.configuration[*]
        content {
          id = configuration.value.id
          revision = configuration.value.revision
        }
  }
  deployment_mode = each.value.deployment_mode
  dynamic "encryption_options" {
      for_each = each.value.encryption_options[*]
        content {
          kms_key_id = encryption_options.value.kms_key_id 
          use_aws_owned_key = encryption_options.value.use_aws_owned_key
        }
  }      
  engine_type = each.value.engine_type
  engine_version = each.value.engine_version
  host_instance_type = each.value.host_instance_type
  publicly_accessible = each.value.publicly_accessible
  security_groups = each.value.security_groups
  subnet_ids = each.value.subnet_ids
  dynamic "maintenance_window_start_time" {
      for_each = each.value.maintenance_window_start_time[*]
        content {
          day_of_week = maintenance_window_start_time.value.day_of_week
          time_of_day = maintenance_window_start_time.value.time_of_day
          time_zone = maintenance_window_start_time.value.time_zone
        }
  }
  dynamic "logs" {
      for_each =each.value.logs[*]
        content {
          general = logs.value.general
          audit = logs.value.audit
        }
  }
  dynamic "user"  {
      for_each = each.value.user[*]
        content {
          username = user.value.username
          password = user.value.password
          groups = user.value.groups
          console_access = user.value.console_access
        }   
  }
  tags = each.value.tags
}