output "vpc_id" {
  value = var.vpc_id != "" ? var.vpc_id : aws_vpc.vpc[0].id
}
output "vpc_cidr" {
  value = "${aws_vpc.vpc[*].cidr_block}"
}

####################################################################
output "private_subnets" {
  value = aws_subnet.private_subnet[*].id
}
output "private_subnets_cidr" {
  value = aws_subnet.private_subnet[*].cidr_block
}

# output "public_subnet_id" {
#   value = aws_subnet.public_subnet.id
# }

# output "public_subnet_cidr" {
#   value = aws_subnet.public_subnet.cidr_block
# }

# output "private_subnet" {
#   value = aws_subnet.private_subnet
# }
# output "aws_vpc_vpc_id" {
#   value = aws_subnet.private_subnets
# }
