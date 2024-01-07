variable "vpc_id" {
  type        = string
  description = "VPC ID"
}


# variable "alb_vpc_id" {
#   type        = string
#   description = "VPC ID"
# }

# variable "private_subnet" {
#   type        = string
#   description = "private subnet for alb"
# }
# variable "private_subnet2" {
#   type        = string
#   description = "public subnet for alb"
# }




variable "private_subnets_ids" {
  description = "Private subnet CIDR list to create a subnet attached with NG"
  type = list(string)
}


variable "environment" {
  description = "The AWS environment"
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


# variable "ssl_policy" {
#   description = "ssl_policy name for alb listener"
# }

# variable "certificate_arn" {
#   description = "certificate_arn for ssl_policy for alb listener"
# }

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