# terraform-aws-s3-backend
Terraform AWS S3 backend module for storing state file.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.82.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.dynamodb_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_iam_role.iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_kms_key.kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_resourcegroups_group.resourcegroups_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/resourcegroups_group) | resource |
| [aws_s3_bucket.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.s3_bucket_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.s3_bucket_server_side_encryption_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.s3_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_caller_identity.current_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_encryption"></a> [kms\_encryption](#input\_kms\_encryption) | Whether S3 bucket encryption should be enabled or not. | `string` | `false` | no |
| <a name="input_princiapl_arn_list"></a> [princiapl\_arn\_list](#input\_princiapl\_arn\_list) | List of principal ARNs allowed to assume the IAM role. | `list(string)` | `null` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Unique name representing the module, will be used to tag resources created by it. | `string` | `"s3-backend"` | no |
| <a name="input_s3_force_destroy_bucket"></a> [s3\_force\_destroy\_bucket](#input\_s3\_force\_destroy\_bucket) | Force destroy the S3 Bucket containing the state file. | `bool` | `false` | no |
| <a name="input_s3_versioning_status"></a> [s3\_versioning\_status](#input\_s3\_versioning\_status) | S3 Bucket versioning status, can be either Enabled or Disabled. | `string` | `"Enabled"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_configurations"></a> [configurations](#output\_configurations) | Should be used as an input when using the S3 backend provider. Contains S3 bucket name, used IAM role ARN, dynamodb table name and AWS region where the resources were deployed. |
<!-- END_TF_DOCS -->

---

## References
1. [Terraform in Action](https://www.manning.com/books/terraform-in-action)
2. [Terraform Best Practices - docs](https://www.terraform-best-practices.com/code-styling#terraform-docs)