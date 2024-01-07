variable "vpc_id" {
  type        = string
  description = "VPC ID of the Existing VPC"
}
variable "vpc_type" {
  type        = string
  description = "Type of the VPC (App or DB)"
}

variable "vpc_cidr_block" {
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

# variable "azs_public_subnet" {
#   description = "availability zone name or ids in the region"
#   type        = string
# }
variable "azs_private_subnet" {
  description = "availability zone name or ids in the region"
  type        = list(string)
}
# variable "private_subnet_count" {
#  }
variable "create_subnets" {
  description = "Set to true to create subnets, false to skip creation"
  type        = bool
  default     = true
}

variable "existing_subnet_ids" {
  description = "List of existing subnet IDs"
  # type        = list(string)
  # default     = []
}
variable "create_ngw" {
  type = bool
}
# variable "security_group_sg_id" {
#   type = string
# }

##########################################################################

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