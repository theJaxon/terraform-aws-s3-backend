variable "project_name" {
  description = "Unique name representing the module, will be used to tag resources created by it."
  type        = string
  default     = "s3-backend"
}

variable "principal_arn_list" {
  description = "List of principal ARNs allowed to assume the IAM role."
  type        = list(string)
  default     = null
}

variable "s3_force_destroy_bucket" {
  description = "Force destroy the S3 Bucket containing the state file."
  type        = bool
  default     = false
}

variable "s3_versioning_status" {
  description = "S3 Bucket versioning status, can be either Enabled or Disabled."
  type        = string
  default     = "Enabled"
}

variable "kms_encryption" {
  description = "Whether S3 bucket encryption should be enabled or not."
  type        = string
  default     = false
}