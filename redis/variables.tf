variable "redis" {
  description = "Redis"
  type = map(object({
    cluster_id  = string
    replication_group_id = string
    engine = string
    engine_version = string
    maintenance_window = string
    node_type = string
    num_cache_nodes = number
    parameter_group_name = string
    port = number
    subnet_group_name = string
    security_group_names = list(string)
    security_group_ids = list(string)
    apply_immediately = bool
    snapshot_name = string
    snapshot_window = string
    snapshot_retention_limit = number
    notification_topic_arn = string
    az_mode = string
    availability_zone = string
    final_snapshot_identifier = string
    tags = map(string)

  }))

  default = {
    redis = {
      cluster_id  = "1"
      replication_group_id = null
      engine = "redis"
      engine_version = null
      maintenance_window = null
      node_type = null
      num_cache_nodes = 1
      parameter_group_name = null
      port = 6379
      subnet_group_name = null
      security_group_names = null
      security_group_ids = null
      apply_immediately = false
      snapshot_name = null
      snapshot_window = null
      snapshot_retention_limit = 1
      notification_topic_arn = null
      az_mode = "single-az"
      availability_zone = null
      final_snapshot_identifier = null
      tags = {
        "Environment" : "dev"
      }
    }
  }
}
