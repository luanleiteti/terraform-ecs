variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "stage" {
  description = "Stage of the cluster"
  type        = string
}

variable "main_cloudwatch_logs_kms_key" {
  description = "IAM policy for the CloudWatch Logs KMS key"
  type        = string
}