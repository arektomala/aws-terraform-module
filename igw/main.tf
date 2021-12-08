resource "aws_internet_gateway" "igw" {
  for_each = var.igw

  vpc_id = each.value.vpc_id
  tags = each.value.tags

  lifecycle {
    create_before_destroy = true
  }
}

