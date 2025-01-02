output "configurations" {
  value = {
    bucket = aws_s3_bucket.s3_bucket.bucket
    region = data.aws_region.current_region.name
    dynamodb_table = aws_dynamodb_table.dynamodb_table.name
  }
}