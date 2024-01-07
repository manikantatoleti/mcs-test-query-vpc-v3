################################################################
# MCS VPC
################################################################
resource "aws_vpc" "vpc" {
  count      = var.vpc_id != "" ? 0 : 1
  cidr_block = var.vpc_cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = var.instance_tenancy
  
  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-vpc",
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

################################################################
# Nat Gateway
################################################################
resource "aws_eip" "nat_gateway_ip" {
  count = var.create_ngw ? 1 : 0
  domain   = "vpc"

  #depends_on = [aws_internet_gateway.vpc_igw]

  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-${var.vpc_type}-nat-eip",
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

resource "aws_nat_gateway" "nat_gateway" {
  count = var.create_ngw ? 1 : 0
  allocation_id = aws_eip.nat_gateway_ip[0].id
  subnet_id     = "${aws_subnet.private_subnet[0].id}"
  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-${var.vpc_type}-nat-gw",
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

  depends_on = [aws_eip.nat_gateway_ip]
}
resource "aws_route_table" "private_route_table" {
 vpc_id = var.vpc_id != "" ? var.vpc_id : aws_vpc.vpc[0].id
  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-${var.vpc_type}-private-rt",
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

resource "aws_route_table_association" "private_rt_association" {
    count = var.create_subnets ? (
    can("${length(var.existing_subnet_ids)}" == "0") ? 2 : 0 
  ) : 0 
  #count = var.private_subnet_count
  subnet_id      = "${aws_subnet.private_subnet[count.index].id}"
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route" "private_route_nat" {
  count = var.create_ngw ? 1 : 0
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_gateway[count.index].id
}

################################################################
#  Private Subnets
################################################################
resource "aws_subnet" "private_subnet" {
  count = var.create_subnets ? (
    can("${length(var.existing_subnet_ids)}" == "0") ? 2 : 0 
  ) : 0  

  #count = var.private_subnet_count
  vpc_id = var.vpc_id != "" ? var.vpc_id : aws_vpc.vpc[0].id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8,count.index+1)
  availability_zone = length(regexall("^[a-z]{2}-", element(var.azs_private_subnet, count.index))) > 0 ? element(var.azs_private_subnet, count.index) : null
  
  #availability_zone = var.azs_private_subnet
  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-${var.vpc_type}-private-subnet"
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


################################################################################
# Private Network ACLs
################################################################################
resource "aws_network_acl" "private_nacl" {
  count = var.create_subnets ? (
    can("${length(var.existing_subnet_ids)}" == "0") ? 2 : 0 
  ) : 0  
  vpc_id     = var.vpc_id != "" ? var.vpc_id : aws_vpc.vpc[0].id
  subnet_ids = ["${aws_subnet.private_subnet[count.index].id}"]
  
  egress {
  rule_no    = 100
  protocol       = "-1"
  action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  }
  ingress {
    rule_no    = 100
    protocol       = "-1"
    action    = "allow"
    cidr_block     = "0.0.0.0/0"
    from_port      = 0
    to_port        = 0
  }








 tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-${var.vpc_type}-private-nacl",
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

# resource "aws_ec2_instance_connect_endpoint" "ec2" {
#   security_group_ids = [
#     var.security_group_sg_id
#   ]
#   subnet_id = "${aws_subnet.private_subnet[0].id}"
# }
