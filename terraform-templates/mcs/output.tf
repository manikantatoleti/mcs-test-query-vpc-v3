output "vpc_id" {
  value = module.mcs_network.vpc_id
}

output "app_vpc_cidr" {
  value = module.mcs_network.vpc_cidr
}

# output "private_subnet" {
#   value = module.mcs_network.private_subnet
# }
output "private_subnet_cidr" {
  value = module.mcs_network.private_subnets_cidr
}
output "private_subnets" {
  value = module.mcs_network.private_subnets
}
# output "debug_subnet_ids" {
#   value = module.mcs_oracle_rds.debug_subnet_ids
# }
# output "public_subnet_id" {
#   value = module.mcs_network.public_subnet
# }
# output "public_subnet_cidr" {
#   value = module.mcs_network.public_subnet_cidr
# }
output "alb_id" {
  value = module.mcs_alb.alb_id
}

output "alb_dns_name" {
  value = module.mcs_alb.alb_dns_name
}

output "alb_listener_id" {
  value = module.mcs_alb.alb_listener_id
}

output "target_group_arn" {
  value = module.mcs_alb.target_group_arn
}

output "listener_rule_id" {
  value = module.mcs_alb.listener_rule_id
}
output "public_key" {
  value = module.mcs_asg.public_key
}
output "lt_id" {
  value = module.mcs_asg.lt_id
}

output "asg_id" {
  value = module.mcs_asg.asg_id
}
output "waf_acl_arn" {
  value = module.mcs_waf.waf_acl_arn
}

output "waf_acl_id" {
  value = module.mcs_waf.waf_acl_id
}
output "efs_file_system_id" {
  description = "The ID of the EFS file system."
  value       = module.mcs_efs.efs_file_system_id
}

output "efs_file_system_arn" {
  description = "The ARN of the EFS file system."
  value       = module.mcs_efs.efs_file_system_arn
}

output "efs_file_system_dns_name" {
  description = "The dns name of the EFS file system."
  value       = module.mcs_efs.efs_file_system_dns_name
}

