terraform {
  required_providers {
    celestialorb = {
      source = "celestialorb/aws"
      version = ">=3.27"
    }
  }
}

resource "aws_cloudsearch_domain" "cloudsearch" {
  provider = celestialorb

  for_each = var.cloudsearch

  name = each.value.name
  instance_type = each.value.instance_type
  replication_count = each.value.replication_count
  partition_count = each.value.partition_count

  dynamic "index" {
    for_each = each.value.index[*]
    content {
      name = index.value.name
      type = index.value.type
      search = index.value.search
      facet = index.value.facet
      return = index.value.return
      sort = index.value.sort
      highlight = index.value.highlight
      analysis_scheme = index.value.analysis_scheme
      default_value = index.value.default_value
    }
  }
  service_access_policies = each.value.service_access_policies
  wait_for_endpoints = each.value.wait_for_endpoints
}