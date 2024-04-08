variable "project_name" {
  description = "Name of the project"
  type        = string
  
}

variable "stage" {
  description = "Stage of the cluster"
  type        = string
}

variable "s3_main_kms_key_policy" {
  description = "IAM policy for the S3 KMS key"
  type        = string
}

variable "ecs_main_kms_key_policy" {
  description = "IAM policy for the ECS KMS key"
  type        = string
}

variable "cloudwatch_logs_main_kms_key_policy" {
  description = "IAM policy for the CloudWatch Logs KMS key"
  type        = string
}

