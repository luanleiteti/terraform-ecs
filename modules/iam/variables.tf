variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "stage" {
  description = "Stage of the cluster"
  type        = string
}

variable "main_alb_bucket_logs_arn" {
  description = "Name of the bucket for the logs"
  type        = string
}

variable "main_alb_bucket_logs_name" {
  description = "Name of the bucket for the logs"
  type        = string

}
