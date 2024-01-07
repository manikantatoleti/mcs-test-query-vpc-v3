output "public_key" {
  value = tls_private_key.example.public_key_openssh
}
# output "private_key" {
#   value = tls_private_key.example.private_key_pem
# }

output "lt_id" {
  value = aws_launch_template.lt_1[*].id
}

output "asg_id" {
  value = aws_autoscaling_group.asg.id
}

output "instance_sg_id" {
  value = aws_security_group.instance_sg.id
}
# output "asg_arn" {
#   value = aws_autoscaling_group.asg.arn
# }