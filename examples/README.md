# terraform-aws-s3-backend example

This will result in the creation of S3 bucket, dynamodb table and an IAM role.

```bash
terraform init
terraform plan
terraform apply
```

### Example outputs
```hcl
s3backend_config = {
  "bucket" = "s3-backend-bpdpfceufksp"
  "dynamodb_table" = "s3-backend-state-lock"
  "region" = "us-east-1"
  "role_arn" = "arn:aws:iam::<>:role/s3-backend-assume-role"
}
```

### Example cleanup
```bash
terraform destroy
```
---

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3backend"></a> [s3backend](#module\_s3backend) | ../ | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3backend_config"></a> [s3backend\_config](#output\_s3backend\_config) | n/a |
<!-- END_TF_DOCS -->