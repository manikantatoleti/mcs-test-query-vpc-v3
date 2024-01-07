
variable "policy_to_attach" {
 type = list(string)
 description = "ARN of the IAM role for appserver" 
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

variable "aws_region" {
  description = "The AWS region to create things in."
  #default     = "us-east-2"
}

variable "environment" {
  type        = string
  description = "Name of the env"
}

variable "purpose" {
  description = "The AWS region to create things in."
  default     = "dev"
}


variable "Request_id" {
  description = "The AWS region to create things in."
  
}

