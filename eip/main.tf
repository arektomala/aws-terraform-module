resource "aws_eip" "eip" {
  for_each = var.eip

  vpc = each.value.vpc
  instance = each.value.instance
  network_interface = each.value.network_interface
  associate_with_private_ip = each.value.associate_with_private_ip
  tags = each.value.tags
  public_ipv4_pool = each.value.public_ipv4_pool
  customer_owned_ipv4_pool = each.value.customer_owned_ipv4_pool
  network_border_group = each.value.network_border_group

  lifecycle {
    create_before_destroy = true
  }
}
