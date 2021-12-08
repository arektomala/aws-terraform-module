data "aws_ami" "ami" {
  for_each = var.ami

  owners = each.value.owners
  most_recent = each.value.most_recent
  executable_users = each.value.executable_users

  dynamic "filter" {
    for_each = each.value.filter[*]
    content {
      name = filter.value.name
      values = filter.value.values
    }
  }
  name_regex = each.value.name_regex
}
