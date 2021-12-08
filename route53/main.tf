resource "aws_route53_record" "record" {
  for_each = var.r53_zone_records

  zone_id = each.value.zone_id
  name = each.value.name
  type = each.value.type
  ttl = each.value.ttl
  records = each.value.records
  set_identifier = each.value.set_identifier
  health_check_id = each.value.health_check_id

  dynamic "alias" {
    for_each = each.value.alias[*]
    content {
      name = alias.value.name
      zone_id = alias.value.zone_id
      evaluate_target_health = alias.value.evaluate_target_health
    }
  }

  dynamic "failover_routing_policy" {
    for_each = each.value.failover_routing_policy[*]
    content {
      type = failover_routing_policy.value.type
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = each.value.geolocation_routing_policy[*]
    content {
      continent = geolocation_routing_policy.value.continent
      country = geolocation_routing_policy.value.country
      subdivision = geolocation_routing_policy.value.subdivision
    }
  }

  dynamic "latency_routing_policy" {
    for_each = each.value.latency_routing_policy[*]
    content {
      region = latency_routing_policy.value.region
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = each.value.weighted_routing_policy[*]
    content {
      weight = weighted_routing_policy.value.weight
    }
  }

  multivalue_answer_routing_policy = each.value.multivalue_answer_routing_policy
  allow_overwrite = each.value.allow_overwrite
}
