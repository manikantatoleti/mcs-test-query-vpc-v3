variable "create_rds" {
  type    = bool 
}

# variable "rds_db_subnet" {
#   type    = bool
#   default = true
# }

variable "rds_engine" {
  description = "Name of the database engine to be used for this DB cluster"

}

variable "db_name" {
  description = "name of db"
}

variable "port" {
  description = "desired "
}
variable "db_private_subnet_ids" {
  description = "Subnet IDs for RDS"
  type = list(string)
}

# variable "db_vpc" {
#   description = "Subnet IDs for RDS"
# }
 variable "db_vpc_id" {
  description = "Subnet IDs for RDS"
  type = string
}

variable"rds_allocated_storage" {
  type = string
  description = "Database engine version"
}

variable"rds_storage_type" {
  type = string
  description = "Database engine version"
}

variable"rds_engine_version" {
  type = string
  description = "Database engine version"
}

variable "app_vpc_cidr" {
  description = "database should allow only the connections from app servers with source ip or CIDR details."
}

variable "deletion_protection" {
  type = bool
}

# # variable "availability_zones" {
# #   type = string
# #   description = "List of EC2 Availability Zones for the DB cluster"
# #   default = ["us-east-1a", "us-east-1b"]
# # }

variable "rds_instance_class" {
  type =string
  description = "Database Instance Class"
  # default = "db.t3.small"
}

# variable "subnet_ids" {
#   type = string
#   description = "Subnet IDs for RDS"
# }

variable "rds_master_username" {
  type = string
  description = "Master User Name for RDS"
  # default = "dbadmin"
}

variable "rds_master_password" {
type = string
  description = "Master Password for RDS"
  # default = "dbadmin2023"
}

# # variable "rds_instance_count" {
# #   type = string
# #   description = "Instance count for RDS"
# #   # default = "2"
# # }

# # variable "rds_database_name" {
# #   type = string
# #   description = "Name for an automatically created database on cluster creation"
# #   # default = "Oracle-DB"
# # }

# #################################################################
variable "environment" {
  type        = string
  description = "Name of the env"
}

variable "aws_region" {
  description = "The AWS region to create things in."
}

variable "requestor" {
  description = "The AWS region to create things in."
  
}

variable "customer" {
  description = "The AWS region to create things in."
 
}

variable "tenant" {
  description = "The AWS region to create things in."

}

variable "product" {
  description = "The AWS region to create things in."
  
}

variable "manager" {
  description = "The AWS region to create things in."
  
}

variable "owner" {
  description = "The AWS region to create things in."
  
}

variable "Request_id" {
  description = "The AWS region to create things in."
  
}
