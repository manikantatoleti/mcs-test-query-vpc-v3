# Tfstate-S3 terraform module

A terraform module to create a backend S3 bucket and DynamoDB table for managing terraform state with locking.

## Module usage:
```hcl
module "tfstate" {
  source = "./modules/tfstate-s3"
  bucket = "Fiserv-tfstate"
  region = "us-east-1"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket | Name of bucket to create; if not provided we will generate a standard name | `string` | `""` | no |
| region | The region where the resources will be deployed | `string` | `"us-east-2"` | no |
| table | Name of Dynamo Table to create | `string` | `"tfstate_lock"` | no |
| tags | Additional tags (e.g. map(`Team`,`DevOps`). | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| s3\_bucket\_backend | S3 bucket |
| table\_name | Dynamodb lock table name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
