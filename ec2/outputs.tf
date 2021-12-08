output "output_instances" {
  value = aws_instance.instance
}

/*
output "output_aws_instance_id" {
  value = aws_instance.instance.*.id
}

output "output_aws_instance_arn" {
  value = aws_instance.instance.*.arn
}

output "output_aws_instance_private_ip" {
  value = aws_instance.instance.*.private_ip
}

output "output_aws_instance_instance_state" {
  value = aws_instance.instance.*.instance_state
}

output "output_aws_instance_public_ip" {
  value = aws_instance.instance.*.public_ip
}

output "output_aws_instance_public_dns" {
  value = aws_instance.instance.*.public_dns
}*/
