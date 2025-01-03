data "aws_caller_identity" "current_caller_identity" {}

locals {
  princiapl_arn_list = var.princiapl_arn_list == null ? [data.aws_caller_identity.current_caller_identity.arn] : var.princiapl_arn_list
}

resource "aws_iam_role" "iam_role" {
  name = "${var.project_name}-assume-role"
  assume_role_policy = templatefile("${path.module}/templates/assume-role-policy.json.tftpl", {
    principal_arn_list = local.princiapl_arn_list[0]
  })
  tags = {
    ResourceGroup = var.project_name
  }
}

resource "aws_iam_role_policy" "iam_role_policy" {
  name = "${var.project_name}-policy"
  role = aws_iam_role.iam_role.id
  policy = templatefile("${path.module}/templates/iam-policy.json.tftpl", {
    dynamodb_table_arn = aws_dynamodb_table.dynamodb_table.arn,
    s3_bucket_arn         = aws_s3_bucket.s3_bucket.arn
  })
}