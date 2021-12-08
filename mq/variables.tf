variable  "mq" {
  description = "MQ"
  type = map(object({
    apply_immediately = bool
    auto_minor_version_upgrade = bool
    broker_name = string
    configuration = object({
      id = string
      revision = string
    })
    deployment_mode = string
    encryption_options = object({
      kms_key_id = string 
      use_aws_owned_key = bool
    })
    engine_type = string
    engine_version = string
    host_instance_type = string
    publicly_accessible = bool
    security_groups = list(string)
    subnet_ids = list(string) 
    maintenance_window_start_time = object({
      day_of_week = string
      time_of_day = string
      time_zone = string
    })
    logs = object({
      general = bool
      audit = bool
    })
    user = object({
      username = string
      password = string
      groups = list(string)
      console_access = bool
    })
    tags = map(string)
  }))

  default = {
    mq = {  
      apply_immediately = false
      auto_minor_version_upgrade = false
      broker_name = "default broker name"
      configuration = {
        id = "id_configuration"
        revision = "revision_latest_configuration"
      }
      deployment_mode = "SINGLE_INSTANCE"
      encryption_options = null
      engine_type = "ActiveMQ"
      engine_version = "5.15.14"
      host_instance_type = "mq.t2.micro"
      publicly_accessible = true
      security_groups = ["null"]
      subnet_ids = ["null"]
      maintenance_window_start_time = null
      logs = null
      user = {
        username = "USER1"
        password = "PASSWORD123"
        groups = null
        console_access = true
      }
      tags = {
             "Environment" : "dev"
            }    
    }
  } 
}