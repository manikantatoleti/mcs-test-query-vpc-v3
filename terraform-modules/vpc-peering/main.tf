resource "aws_vpc_peering_connection" "requester" {
  peer_vpc_id = "${var.peer_vpc_id}"
  vpc_id      = "${var.vpc_id}"
  peer_owner_id = var.peer_owner_id
  auto_accept = false
  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-vpc-Peering",
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

resource "aws_vpc_peering_connection_accepter" "accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.requester.id
  auto_accept               = true
  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-vpc-Peering",
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
