output "oracle_db_sg" {
  value = aws_security_group.oracle_db_sg[0].id
}
