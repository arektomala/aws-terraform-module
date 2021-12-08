resource "aws_customer_gateway" "customer_gateway" {

  for_each = var.customer_gateway

  bgp_asn = each.value.bgp_asn
  ip_address = each.value.ip_address
  type = each.value.type
}
