
module "mcs_network" {
  source = "../../terraform-modules/network"
    vpc_id = var.app_vpc_id
    existing_subnet_ids = var.existing_subnet_ids
    create_subnets = var.create_subnets
    vpc_type = var.vpc_type
    vpc_cidr_block = var.app_vpc_cidr_block
    enable_dns_support = var.enable_dns_support
    enable_dns_hostnames = var.enable_dns_hostnames
    instance_tenancy = var.instance_tenancy
    environment = var.environment
    aws_region = var.aws_region
    #azs_public_subnet = var.azs_public_subnet
    azs_private_subnet = var.azs_private_subnet
    create_ngw = var.create_ngw
    requestor            = var.requestor
    customer             = var.customer
    tenant               = var.tenant
    product              = var.product
    manager              = var.manager
    owner                = var.owner
    Request_id = var.Request_id

    

}

module "mcs_alb" {
    source = "../../terraform-modules/alb"
    other_cidr_blocks = var.other_cidr_blocks
    #private_subnets_ids = var.existing_subnet_ids != "" ? var.existing_subnet_ids : module.mcs_network.private_subnets 
    #private_subnets_ids = length(var.existing_subnet_ids) > 0 ? var.existing_subnet_ids : module.mcs_network.private_subnets
    private_subnets_ids = length(var.existing_subnet_ids) > 0 ? split(", ", var.existing_subnet_ids) : module.mcs_network.private_subnets 
    #private_subnet = var.existing_subnet_ids != "" ? element(var.existing_subnet_ids, 0) : module.mcs_network.private_subnets[0]
    #private_subnet2 = var.existing_subnet_ids != "" ? var.existing_subnet_ids[1] : module.mcs_network.private_subnets[1]
    vpc_id = var.app_vpc_id != "" ? var.app_vpc_id : module.mcs_network.vpc_id
    #vpc_id = module.mcs_network.vpc_id
    lb_listener_port = var.lb_listener_port
    lb_listener_protocol = var.lb_listener_protocol
    environment = var.environment
    aws_region = var.aws_region
    requestor            = var.requestor
    customer             = var.customer
    tenant               = var.tenant
    product              = var.product
    manager              = var.manager
    owner                = var.owner
    Request_id           = var.Request_id
    
}

module "mcs_waf"{
    source = "../../terraform-modules/waf"
    create_waf = var.create_waf
    alb_resource_arn = module.mcs_alb.alb_arn
    #alb_resource_arn = var.alb_resource_arn != "" ? "${var.alb_resource_arn}" : (length(module.mcs_alb.alb_arn) > 0 ? module.mcs_alb.alb_arn[0] : null)
    waf_acl_scope = var.waf_acl_scope
    environment = var.environment
    aws_region = var.aws_region
    requestor            = var.requestor
    customer             = var.customer
    tenant               = var.tenant
    product              = var.product
    manager              = var.manager
    owner                = var.owner
    Request_id           = var.Request_id
    
    depends_on = [ module.mcs_alb ]
}

module "mcs_asg" {
    source = "../../terraform-modules/autoscaling"
    lt_image_id = var.lt_image_id
    instance_type = var.instance_type
    root_volume_size = var.root_volume_size
    asg_max_size = var.asg_max_size
    asg_min_size = var.asg_min_size
    asg_desired_capacity = var.asg_desired_capacity
    #private_subnets_cidr = module.mcs_network.private_subnets_cidr
    #private_subnet = var.existing_subnet_ids != "" ? element(var.existing_subnet_ids, 0) : module.mcs_network.private_subnets[0]
    private_subnet = length(var.existing_subnet_ids) > 0 ? element(split(", ", var.existing_subnet_ids), 0) : module.mcs_network.private_subnets[0]
    target_group_arns = module.mcs_alb.target_group_arn
    iam_instance_profile = var.iam_instance_profile
    #vpc_id = module.mcs_network.vpc_id
    vpc_id = var.app_vpc_id != "" ? var.app_vpc_id : module.mcs_network.vpc_id
    efs_file_system_dns_name = module.mcs_efs.efs_file_system_dns_name
    environment = var.environment
    aws_region = var.aws_region
    requestor            = var.requestor
    customer             = var.customer
    tenant               = var.tenant
    product              = var.product
    manager              = var.manager
    owner                = var.owner
    Request_id           = var.Request_id
    vpc_cidr = var.cas_vpc_cidr
    app_vpp_cidr = var.app_vpc_cidr_block
    mss_cidr = var.mss_cidr
    security_group_sg_id = module.mcs_asg.instance_sg_id
    #private_subnet_id = var.existing_subnet_ids != "" ? element(var.existing_subnet_ids, 0) : module.mcs_network.private_subnets[0]
    private_subnet_id = length(var.existing_subnet_ids) > 0 ? element(split(", ", var.existing_subnet_ids), 0) : module.mcs_network.private_subnets[0]
    
    depends_on = [ module.mcs_alb, module.mcs_efs]

}


module "mcs_efs" {
  source = "../../terraform-modules/efs"
  #private_subnet_id = var.existing_subnet_ids != "" ? var.existing_subnet_ids[0] : module.mcs_network.private_subnets[0]
  #private_subnet_id = length(var.existing_subnet_ids) > 0 ? element(var.existing_subnet_ids, 0) : module.mcs_network.private_subnets[0]
  private_subnet_id = length(var.existing_subnet_ids) > 0 ? element(split(", ", var.existing_subnet_ids), 0) : module.mcs_network.private_subnets[0]  
  #private_subnet_id = var.existing_subnet_ids != "" ? element(var.existing_subnet_ids, 0) : module.mcs_network.private_subnets[0]
  vpc_id = module.mcs_network.vpc_id
  environment = var.environment
  aws_region = var.aws_region
  requestor            = var.requestor
  customer             = var.customer
  tenant               = var.tenant
  product              = var.product
  manager              = var.manager
  owner                = var.owner
  Request_id           = var.Request_id
    
}

module "mcs_oracle_rds" {
    source = "../../terraform-modules/rds"
    db_vpc_id = module.mcs_network.vpc_id
    rds_engine = var.oracle_rds_engine
    rds_allocated_storage = var.rds_allocated_storage
    db_name = var.db_name
    port = var.rds_port
    rds_storage_type = var.rds_storage_type
    rds_engine_version = var.oracle_rds_engine_version
    rds_instance_class = var.rds_instance_class
    rds_master_username = var.oracle_rds_username
    rds_master_password = var.oracle_rds_password
    #db_private_subnet_ids = var.existing_subnet_ids != "" ? var.existing_subnet_ids : module.mcs_network.private_subnets
    #db_private_subnet_ids = length(var.existing_subnet_ids) > 0 ? var.existing_subnet_ids : module.mcs_network.private_subnets
    db_private_subnet_ids = length(var.existing_subnet_ids) > 0 ? split(", ", var.existing_subnet_ids) : module.mcs_network.private_subnets
    #db_private_subnet_ids = var.existing_subnet_ids != "" ? (can(list(var.existing_subnet_ids)) ? [var.existing_subnet_ids] : var.existing_subnet_ids) : module.mcs_network.private_subnets
    #db_private_subnet_ids = module.mcs_network.private_subnets
    # db_private_subnet_ids = var.existing_subnet_ids != "" ? var.existing_subnet_ids : module.mcs_network.private_subnets != [] ? module.mcs_network.private_subnets : null
    create_rds = var.create_rds
    app_vpc_cidr = var.app_vpc_cidr_block
    environment = var.environment
    aws_region = var.aws_region
    requestor            = var.requestor
    customer             = var.customer
    tenant               = var.tenant
    product              = var.product
    manager              = var.manager
    owner                = var.owner
    Request_id           = var.Request_id
    deletion_protection = var.deletion_protection

    
}

module "iam_role" {
  source                     = "../../terraform-modules/iam-role"
  policy_to_attach           = var.policy_to_attach
  environment                = var.environment
  aws_region                 = var.aws_region
  requestor                  = var.requestor
  customer                   = var.customer
  tenant                     = var.tenant
  product                    = var.product
  manager                    = var.manager
  owner                      = var.owner
  Request_id                 = var.Request_id
}
