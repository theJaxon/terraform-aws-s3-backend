data "aws_region" "current_region" {}

resource "aws_kms_key" "kms_key" {
  count = var.kms_encryption ? 1 : 0
  tags = {
    ResourceGroup = var.project_name
  }
}

resource "aws_resourcegroups_group" "resourcegroups_group" {
  name = "${var.project_name}-group"
  resource_query {
    query = <<JSON
      {
        "ResourceTypeFilters": [ "AWS::EC2::Instance" ],
        "TagFilters": [{
        "Key": "ResourceGroup",
        "Values": ["${var.project_name}"]}]
      }
    JSON
  }
}

resource "random_string" "random" {
  length  = 12
  special = false
  upper   = false
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket        = "${var.project_name}-${random_string.random.result}"
  force_destroy = var.s3_force_destroy_bucket
  tags = {
    ResourceGroup = "${var.project_name}"
  }
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = var.s3_versioning_status
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_server_side_encryption_configuration" {
  count  = var.kms_encryption ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.kms_key[0].arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_dynamodb_table" "dynamodb_table" {
  name         = "${var.project_name}-state-lock"
  hash_key     = "LockId"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockId"
    type = "S"
  }
  tags = {
    ResourceGroup = "${var.project_name}"
  }
}