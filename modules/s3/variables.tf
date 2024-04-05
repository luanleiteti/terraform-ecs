variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "stage" {
  description = "Stage of the cluster"
  type        = string
}

variable "main_s3_kms_key" {
  description = "Main KMS key for s3"
}