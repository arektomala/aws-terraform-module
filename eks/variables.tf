variable "eks" {
  
  type = map(object({
    name = string
    role_arn = string
    vpc_config = object({
      endpoint_private_access = bool
      endpoint_public_access = bool
      public_access_cidr = string
      security_group_ids = string
      subnet_ids = string
    })
    enabled_cluster_log_types = bool
    encryption_config = object({
      provider = object({
        key_arn = string

      })
      resources = string
    })
    kubernetes_network_config = object({
      service_ipv4_cidr = string
      ip_family = string
    })
    tags = map(string)
    version = string


  }))

}