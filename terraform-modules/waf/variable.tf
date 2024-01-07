variable "create_waf" {
  type    = bool
  # default = true
}

variable "alb_resource_arn" {
  description = "The arn of ALB"
  type        = string
}

variable "waf_acl_scope" {
  description = "The Scope for Waf ACl"
  type        = string
  default = "REGIONAL"
}

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