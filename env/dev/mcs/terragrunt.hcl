################################################################################
# Source Path
################################################################################

terraform {
  #source = "git@github.com:manikantatholeti/maniterragrunt.git//terraform-templates/jenkins/"
  source = "../../..//terraform-templates/mcs"
}
################################################################################
# Dependancy Path (If Any)
################################################################################



################################################################################
# Inputs
################################################################################
inputs = {
#app_vpc_id = "vpc-0f6c22783fb770742"
vpc_type = "app_vpc"
#app_vpc_cidr_block = "12.0.0.0/16"
#azs_private_subnet = ["us-east-1a","us-east-1b"]
enable_dns_support = true
enable_dns_hostnames = true
#environment = "dev"
#aws_region               = "us-east-1"
#requestor                = "poomalairaj.r@ondotsystems.com"
#customer                 = "ondot"
#tenant                   = "multi"
#product                  = "mcs"
#manager                  = "rajesh.gurumurthy@fiserv.com"
#owner                    = "vigneswaran.shanmugam@fiserv.com"
#Request_id               = "test"
other_cidr_blocks        = "0.0.0.0/0"
lb_listener_port = "80"
lb_listener_protocol = "HTTP"
asg_desired_capacity = "2"
asg_max_size = "2"
asg_min_size = "2"
iam_instance_profile = "build_infra_role"
#instance_type = "t2.micro"
#lt_image_id = "ami-0230bd60aa48260c6" #"ami-0fc5d935ebf8bc3bc"
#root_volume_size = "2"
cas_vpc_cidr = "180.16.0.0/16"
mss_cidr = "181.16.0.0/16"
#create_waf = "false"
#create_subnets = false
#existing_subnet_ids = ["subnet-04821ddf7b148948e", "subnet-0425dc2f53874f4a2"]
#oracle_rds_engine = "oracle-ee"
#rds_allocated_storage = "20"
#db_name = "devrds"
#rds_port = "3306"
#rds_instance_class = "db.t3.medium"
rds_storage_type = "gp2"
#oracle_rds_engine_version = "19.0.0.0.ru-2023-07.rur-2023-07.r1"
oracle_rds_username = "db_user" 
oracle_rds_password = "Admin123"
#create_rds = "true"
policy_to_attach = ["arn:aws:iam::aws:policy/AmazonCloudWatchRUMFullAccess", 
"arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy", 
"arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy", 
"arn:aws:iam::aws:policy/AmazonS3FullAccess", 
"arn:aws:iam::aws:policy/service-role/ROSAKMSProviderPolicy", 
"arn:aws:iam::aws:policy/SecretsManagerReadWrite"]
#deletion_protection = false
create_ngw = false
}
