resource "aws_security_group" "oracle_db_sg" {
  count = var.create_rds ? 1 : 0
  name        = "${var.customer}-${var.environment}-${var.product}-oracle-rds-sg"
  description = "Security group for Oracle RDS"
  vpc_id      = var.db_vpc_id 

    ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.app_vpc_cidr]
    }

  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-oracle-rds",
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
resource "aws_db_subnet_group" "oracle_subnet_group" {
  count = var.create_rds ? 1 : 0
  name       = "${var.customer}-${var.environment}-${var.product}-oracle-rds-subnet-group"
  subnet_ids = var.db_private_subnet_ids
  tags = {
    "Name" = "${var.environment}-${var.product}-oracle-rds",
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

resource "aws_db_instance" "oracle_rds" {
  count = var.create_rds ? 1 : 0
  identifier = "${var.customer}-${var.environment}-${var.product}-oracle-rds"
  allocated_storage    = var.rds_allocated_storage
  db_name              = var.db_name
  storage_type         = var.rds_storage_type
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instance_class
  username             = var.rds_master_username
  password             = var.rds_master_password
  port                 = var.port
  vpc_security_group_ids = [aws_security_group.oracle_db_sg[0].id]
  db_subnet_group_name  = "${aws_db_subnet_group.oracle_subnet_group[0].name}"
  skip_final_snapshot = true 
  deletion_protection = var. deletion_protection
  storage_encrypted = true
tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-oracle-rds",
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




