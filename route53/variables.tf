variable "r53_zone_records" {
  description = "Records for R53 zones"
  type = map(object({
    zone_id = string
    name = string
    type = string
    ttl = number
    records = list(string)
    set_identifier = string
    health_check_id = string
    alias = object({
      name = string
      zone_id = string
      evaluate_target_health = bool
    })
    failover_routing_policy = object({
      type = string
    })
    geolocation_routing_policy = object({
      continent = string
      country = string
      subdivision = string
    })
    latency_routing_policy = object({
      region = string
    })
    weighted_routing_policy = object({
      weight = string
    })
    multivalue_answer_routing_policy = bool
    allow_overwrite = bool
  }))
}
