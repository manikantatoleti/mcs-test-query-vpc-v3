variable "vpc_id" {
}
# variable "subnet_ids" {
#   description = "subnet ID where EFS will be mounted."
#   type        = list(string)
# }

variable "private_subnet_id" {
  description = "Private Subnet to be attached to efs"
  #type = string
}

# variable "subnet_id_1" {
#   description = "subnet ID where EFS will be mounted."
#   type        = string
# }

# variable "subnet_id_2" {
#   description = "subnet ID where EFS will be mounted."
#   type        = string
# }

variable "environment" {
  description = "The AWS environment"
  type = string
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