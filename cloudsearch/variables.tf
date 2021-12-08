variable  "cloudsearch" {
  description = "CloudSearch"
  type = map(object({
    name = string
    instance_type = string
    replication_count = number
    partition_count = number
    index = list(object({
      name = string
      type = string
      search = bool
      facet = bool
      return = bool
      sort = bool
      highlight = bool
      analysis_scheme = string
      default_value = string
    }))
    service_access_policies = string
    wait_for_endpoints = bool
  }))
}