<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_key_pair.deployer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_launch_configuration.lc_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |
| [tls_private_key.example](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_desired_capacity"></a> [asg\_desired\_capacity](#input\_asg\_desired\_capacity) | ecs\_desired\_capacity | `string` | n/a | yes |
| <a name="input_asg_max_size"></a> [asg\_max\_size](#input\_asg\_max\_size) | asg\_max\_size | `string` | n/a | yes |
| <a name="input_asg_min_size"></a> [asg\_min\_size](#input\_asg\_min\_size) | asg\_min\_size | `string` | n/a | yes |
| <a name="input_asg_security_group_id"></a> [asg\_security\_group\_id](#input\_asg\_security\_group\_id) | Security Group id for Auto Scaling Group | `any` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to create things in. | `string` | `"us-west-2"` | no |
| <a name="input_customer"></a> [customer](#input\_customer) | The AWS region to create things in. | `string` | `"ondot"` | no |
| <a name="input_ecs_base_ami_name"></a> [ecs\_base\_ami\_name](#input\_ecs\_base\_ami\_name) | ecs\_base\_ami\_name | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The AWS environment | `string` | `"dev"` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | iam\_instance\_profile for Lunch Configuration | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | instance\_type | `string` | n/a | yes |
| <a name="input_lc_image_id"></a> [lc\_image\_id](#input\_lc\_image\_id) | launch config image id | `string` | n/a | yes |
| <a name="input_manager"></a> [manager](#input\_manager) | The AWS region to create things in. | `string` | `"rajesh.gurumurthy@fiserv.com"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPC | `string` | `"ptmaps"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The AWS region to create things in. | `string` | `"vigneswaran.shanmugam@fiserv.com"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Private subnet ID list to create a subnet attached with NG | `any` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | The AWS region to create things in. | `string` | `"tde"` | no |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | The AWS region to create things in. | `string` | `"dev"` | no |
| <a name="input_requestor"></a> [requestor](#input\_requestor) | The AWS region to create things in. | `string` | `"poomalairaj.r@ondotsystems.com"` | no |
| <a name="input_resource_name"></a> [resource\_name](#input\_resource\_name) | resource\_name | `any` | n/a | yes |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | root\_volume\_size | `string` | n/a | yes |
| <a name="input_target_group_arns"></a> [target\_group\_arns](#input\_target\_group\_arns) | ALB target\_group\_arns | `any` | n/a | yes |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | The AWS region to create things in. | `string` | `"single"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_id"></a> [asg\_id](#output\_asg\_id) | n/a |
| <a name="output_lc_id"></a> [lc\_id](#output\_lc\_id) | n/a |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | n/a |
| <a name="output_public_key"></a> [public\_key](#output\_public\_key) | n/a |
<!-- END_TF_DOCS -->