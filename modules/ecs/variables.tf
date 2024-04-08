variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "stage" {
  description = "Stage of the cluster"
  type        = string
}

variable "desired_capacity" {
  description = "Desired capacity of the ECS cluster"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the ECS cluster"
  type        = number
}

variable "min_size" {
  description = "Minimum size of the ECS cluster"
  type        = number
}

variable "subnet_ids" {
  description = "Subnet IDs for the ECS cluster"
  type        = list(string)
}

variable "grace_period" {
  description = "Health check grace period"
  type        = number
}

variable "health_check_type" {
  description = "Health check type"
  type        = string
}

variable "default_cooldown" {
  description = "Default cooldown"
  type        = number
}

variable "default_instance_warmup" {
  description = "Default instance warmup"
  type        = number
}

variable "ecs_instance_type" {
  description = "Instance type"
  type        = string
}

variable "ecs_key_name" {
  description = "Key name for the ECS instances"
  type        = string
}

variable "security_group_ids" {
  description = "Security group ID for the ECS instances"
  type        = string
}

variable "ecs_volume_size" {
  description = "Volume size for the ECS instances"
  type        = number
}

variable "aws_iam_instance_profile" {
  description = "IAM instance profile for the ECS instances"
  type        = string
}
