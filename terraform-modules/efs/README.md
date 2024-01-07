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
| [aws_efs_file_system.app_efs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.efs_mount_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to create things in. | `any` | n/a | yes |
| <a name="input_customer"></a> [customer](#input\_customer) | Name of the Customer | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The AWS environment | `any` | n/a | yes |
| <a name="input_manager"></a> [manager](#input\_manager) | Email ID of the Manager | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPC | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Email ID of the owner | `any` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Name of the Product | `any` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | Name of the Purpose | `any` | n/a | yes |
| <a name="input_requestor"></a> [requestor](#input\_requestor) | Email ID of the requester | `any` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of subnet IDs where EFS will be mounted. | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of security group IDs for EFS access. | `string` | n/a | yes |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | Type of the Tenant (single/multi) | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_efs_file_system_arn"></a> [efs\_file\_system\_arn](#output\_efs\_file\_system\_arn) | The ARN of the EFS file system. |
| <a name="output_efs_file_system_dns_name"></a> [efs\_file\_system\_dns\_name](#output\_efs\_file\_system\_dns\_name) | The ARN of the EFS file system. |
| <a name="output_efs_file_system_id"></a> [efs\_file\_system\_id](#output\_efs\_file\_system\_id) | The ID of the EFS file system. |
<!-- END_TF_DOCS -->