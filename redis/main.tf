resource "aws_elasticache_cluster" "redis" {

for_each = var.redis

  cluster_id  = each.value.cluster_id
  replication_group_id = each.value.replication_group_id
  engine = each.value.engine
  engine_version = each.value.engine_version
  maintenance_window = each.value.maintenance_window
  node_type = each.value.node_type
  num_cache_nodes = each.value.num_cache_nodes
  parameter_group_name = each.value.parameter_group_name
  port = each.value.port
  subnet_group_name = each.value.subnet_group_name
  security_group_names = each.value.security_group_names
  security_group_ids = each.value.security_group_ids
  apply_immediately = each.value.apply_immediately
  snapshot_name = each.value.snapshot_name
  snapshot_window = each.value.snapshot_window
  snapshot_retention_limit = each.value.snapshot_retention_limit
  notification_topic_arn = each.value.notification_topic_arn
  az_mode = each.value.az_mode
  availability_zone = each.value.availability_zone
  final_snapshot_identifier = each.value.final_snapshot_identifier
  tags = each.value.tags

}
