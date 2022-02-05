resource "aws_eks_cluster" "eks" {
  for_each = var.eks

  name                      = each.value.name
  role_arn                  = each.value.role_arn
  dynamic "vpc_config" {
    for_each = each.value.vpc_config[*]
    content {
      endpoint_private_access = vpc_config.value.endpoint_private_access
      endpoint_public_access  = vpc_config.value.endpoint_public_access
      public_access_cidr      = vpc_config.value.public_access_cidr
      security_group_ids      = vpc_config.value.security_group_ids
      subnet_ids              = vpc_config.value.subnet_ids
    }
  }
  enabled_cluster_log_types = each.value.enabled_cluster_log_types
  dynamic "encryption_config" {
    for_each = each.value.encryption_config[*]
    content {
      dynamic "provider" {
        for_each = encryption_config.value.provider[*]
        content {
          key_arn = provider.value.key_arn
        }}
      resources = encryption_config.value.resources
      }
    }
  dynamic "kubernetes_network_config" {
    for_each = each.value.kubernetes_network_config[*]
    content {
      service_ipv4_cidr = kubernetes_network_config.value.service_ipv4_cidr
      ip_family  = kubernetes_network_config.value.ip_family

    }
  }
  tags = each.value.tags
  version = each.value.version
  }

