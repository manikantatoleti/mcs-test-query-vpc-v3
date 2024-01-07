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
variable "efs_file_system_dns_name" {
description = "efs file system dns name from mount to directory"  
}

# variable "private_subnets_cidr" {
#   description = "Private subnet ID list to create a subnet attached with NG"
#   type = string
# }
variable "vpc_cidr" {
  description = "vpc cidr for whitelisted to connect with CAS resources"
}

# variable "db_cidr" {
#   description = "rds db cidr"
# }

variable "app_vpp_cidr" {
  description = "app vpc cidr "
}

variable "mss_cidr" {
  description = "used for Security components from Centralized account (MSS)"
}

variable "private_subnet" {
  description = "Private subnet ID "
  type = string
}

variable "vpc_id" {
  type        = string
  description = "VPC ID of the Existing VPC"
}


variable "iam_instance_profile" {
  description = "iam_instance_profile for Lunch Configuration"
}


variable "target_group_arns" {
  description = "ALB target_group_arns"
}

# variable "security_group_sg_id" {
#   type = string
# }

variable "environment" {
  description = "The AWS environment"
  
}

variable "aws_region" {
  description = "The AWS region to create things in."
  }

variable "requestor" {
  description = "The AWS regi."
  
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
variable "security_group_sg_id" {
  type = string
}
variable "private_subnet_id" {
 type        = string
}