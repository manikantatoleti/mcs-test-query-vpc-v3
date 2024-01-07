<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.rds_db_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_rds_cluster.aurora_mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.cluster_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to create things in. | `string` | `"us-west-2"` | no |
| <a name="input_customer"></a> [customer](#input\_customer) | The AWS region to create things in. | `string` | `"ondot"` | no |
| <a name="input_db_subnet_ids"></a> [db\_subnet\_ids](#input\_db\_subnet\_ids) | Subnet IDs for RDS | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the env | `string` | n/a | yes |
| <a name="input_manager"></a> [manager](#input\_manager) | The AWS region to create things in. | `string` | `"rajesh.gurumurthy@fiserv.com"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPC | `string` | `"ptmaps"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The AWS region to create things in. | `string` | `"vigneswaran.shanmugam@fiserv.com"` | no |
| <a name="input_product"></a> [product](#input\_product) | The AWS region to create things in. | `string` | `"tde"` | no |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | The AWS region to create things in. | `string` | `"dev"` | no |
| <a name="input_rds_engine_version"></a> [rds\_engine\_version](#input\_rds\_engine\_version) | Database engine version | `string` | `"5.7.mysql_aurora.2.11.2"` | no |
| <a name="input_rds_instance_class"></a> [rds\_instance\_class](#input\_rds\_instance\_class) | Database Instance Class | `any` | n/a | yes |
| <a name="input_rds_instance_count"></a> [rds\_instance\_count](#input\_rds\_instance\_count) | Instance count for RDS | `any` | n/a | yes |
| <a name="input_rds_master_password"></a> [rds\_master\_password](#input\_rds\_master\_password) | Master Password for RDS | `string` | n/a | yes |
| <a name="input_rds_master_username"></a> [rds\_master\_username](#input\_rds\_master\_username) | Master User Name for RDS | `string` | n/a | yes |
| <a name="input_requestor"></a> [requestor](#input\_requestor) | The AWS region to create things in. | `string` | `"poomalairaj.r@ondotsystems.com"` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | The AWS region to create things in. | `string` | `"single"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_instances_arns"></a> [cluster\_instances\_arns](#output\_cluster\_instances\_arns) | n/a |
| <a name="output_cluster_instances_ids"></a> [cluster\_instances\_ids](#output\_cluster\_instances\_ids) | n/a |
| <a name="output_rds_cluster_arn"></a> [rds\_cluster\_arn](#output\_rds\_cluster\_arn) | n/a |
| <a name="output_rds_cluster_id"></a> [rds\_cluster\_id](#output\_rds\_cluster\_id) | n/a |
<!-- END_TF_DOCS -->