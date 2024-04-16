variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "stage" {
  description = "Stage of the cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "health_check" {
  description = "Health check path"
  type        = string
  default     = "/"
}

variable "main_containerPort" {
  description = "Port for the container"
  type        = number

}

variable "main_alb_id" {
  description = "ID of the main ALB"
  type        = string
}