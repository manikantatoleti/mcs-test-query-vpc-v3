output "appserver_iam_role_arn" {
    value = aws_iam_role.iam-for-appserver.arn
}

output "appserver_iam_profile" {
  value = aws_iam_instance_profile.appserver_iam_profile.name
}

