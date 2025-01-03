output "configurations" {
  description = "Should be used as an input when using the S3 backend provider. Contains S3 bucket name, used IAM role ARN, dynamodb table name and AWS region where the resources were deployed."
  value = {
    bucket         = aws_s3_bucket.s3_bucket.bucket
    region         = data.aws_region.current_region.name
    role_arn       = aws_iam_role.iam_role.arn
    dynamodb_table = aws_dynamodb_table.dynamodb_table.name
  }
}