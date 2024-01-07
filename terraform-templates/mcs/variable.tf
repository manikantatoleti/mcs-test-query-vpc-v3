
# variable "private_subnet_count" {
#   description = "app vpc private subnet count"
# }
variable "app_vpc_id" {
  type        = string
  description = "VPC ID of the Existing VPC"
  default = ""
}
variable "create_subnets" {
  description = "Set to true to create subnets, false to skip creation"
  type        = bool
  #default     = true
}

variable "existing_subnet_ids" {
  description = "List of existing subnet IDs"
  #type        = list(string)
  default = []
  }
variable "vpc_type" {
  type        = string
  description = "Type of the VPC (App or DB)"
}


variable "app_vpc_cidr_block" {
  description = "VPC CIDR range"
  type    = string
}
variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults to true."
  type    = bool
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type    = bool
}

variable "instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  type    = string
  default = "default"
}

variable "azs_private_subnet"{
  description = "availability zone name or ids in the region"
  type        = list(string)
}

variable "create_ngw" {
  type = bool
}
##########################################################################

variable "other_cidr_blocks" {
  type        = string
  description = "CIDR Blocks for Security Group"
}

variable "lb_listener_port" {
  type = string
  description = "Listener Port No for Load Balancer"
}

variable "lb_listener_protocol" {
  type = string
  description = "Listener Port No for Load Balancer"
}

# ##########################################################################
variable "create_waf" {
  type    = bool
  # default = true
}

variable "waf_acl_scope" {
  description = "The Scope for Waf ACl"
  type        = string
  default = "REGIONAL"
}
# ##########################################################################

variable "lt_image_id" {
  type        = string
  description = "launch config image id"
}

variable "instance_type" {
  type        = string
  description = "instance_type"
}

variable "root_volume_size" {
  type        = string
  description = "root_volume_size"
}

variable "asg_max_size" {
  type        = string
  description = "asg_max_size"
}

variable "asg_min_size" {
  type        = string
  description = "asg_min_size"
}

variable "asg_desired_capacity" {
  type        = string
  description = "ecs_desired_capacity"
}

variable "iam_instance_profile" {
  description = "iam_instance_profile for Lunch Configuration"
}
variable "cas_vpc_cidr" {
  description = "vpc cidr for whitelisted to connect with CAS resources"
}
variable "mss_cidr" {
  description = "used for Security components from Centralized account (MSS)"
}


# ##########################################################################
variable "oracle_rds_engine" {
  description = "rds engine name"
}
variable "rds_allocated_storage" {
  description = "rds allocated storage size"  
}
variable "rds_storage_type" {
  description = "rds storage type"
}
variable "oracle_rds_engine_version" {
  description = "engine version of the rds"
}
variable "rds_instance_class" {
  description = "instance class of the rds"
}
variable "oracle_rds_username" {
  description = "user name of the rds"
}
variable "oracle_rds_password" {
  description = "password of the oracle rds"
}
variable "create_rds" {
  description = "rds create true or false"
  type = bool
}
variable "db_name" {
  description = "name of tha db"
}

variable "rds_port" {
  description = "specify tha desired port"
}
variable "deletion_protection" {
  type = bool
  description = "delete protection true or flase"
}
# ##########################################################################

variable "environment" {
  description = "Name of the env"
}

variable "aws_region" {
  description = "The AWS region to create things in."
}

variable "requestor" {
  description = "Email ID for the requestor."
  
}

variable "customer" {
  description = "Customer Name for MCS."
 
}

variable "tenant" {
  description = "Tenant Name for MCS."
 
}

variable "product" {
  description = "Product Name for MCS."
  
}

variable "manager" {
  description = "Email ID for the Manager for MCS."
  
}

variable "owner" {
  description = "Email ID for the Owner for MCS."
  
}

variable "Request_id" {
  description = "Request Id for MCS."

}

variable "policy_to_attach" {
 type = list(string)
 description = "ARN of the IAM role for appserver" 
}
