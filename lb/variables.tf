variable "lb" {
  description = "Load Balancer"
  type = map(object({
    name = string
    name_prefix = string
    internal = bool
    load_balancer_type = string
    security_groups = list(string)
    drop_invalid_header_fields = bool
    access_logs = object({
      bucket = string
      prefix = string
      enabled = bool
    })
    subnets = list(string)
    subnet_mapping = object({
      subnet_id = string
      allocation_id = string
      private_ipv4_address = string
    })
    idle_timeout = number
    enable_deletion_protection = bool
    enable_cross_zone_load_balancing = bool
    enable_http2 = bool
    customer_owned_ipv4_pool = string
    ip_address_type = string
    tags = map(string)
  }))
  default = {
    default-lb-name = {
      name = "project-alb"
      name_prefix = null
      internal = true
      load_balancer_type = "application"
      security_groups = [""]
      drop_invalid_header_fields = true
      access_logs = {
        bucket = ""
        prefix = null
        enabled = false
      }
      subnets = [""]
      subnet_mapping = {
        subnet_id = ""
        allocation_id = ""
        private_ipv4_address = ""
      }
      idle_timeout = 60
      enable_deletion_protection = false
      enable_cross_zone_load_balancing = false
      enable_http2 = true
      customer_owned_ipv4_pool = null
      ip_address_type = "ipv4"
      tags = {
        "Name":"project-alb-name",
        "cost-allocation":"project-cost-allocation",
        "cost-allocation-env":"project-cost-allocation-env"
      }
    }
  }
}
