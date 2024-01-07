 resource "aws_iam_role" "iam-for-appserver" {
   name = "${var.customer}-${var.environment}-${var.product}-iamrole-appserver"  
   assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
    tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-iamrole-appserver",
    "environment" = "${var.environment}",
    "Region" = "${var.aws_region}",
    "requestor" = "${var.requestor}",
    "customer" = "${var.customer}",
    "tenant" = "${var.tenant}",
    "product" = "${var.product}",
    "manager" = "${var.manager}",
    "owner" = "${var.owner}",
    "Request_id" = "${var.Request_id}"
  }
 }

 resource "aws_iam_instance_profile" "appserver_iam_profile" {
  # name = "test_profile"
  role = aws_iam_role.iam-for-appserver.name
}
 

    resource "aws_iam_role_policy_attachment" "attach_policy" {
      count = 6
      policy_arn = element(var.policy_to_attach, count.index)
      role       = "${aws_iam_role.iam-for-appserver.name}" #aws_iam_role.iam-for-appserver.name
    }

    