variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "stage" {
  description = "Stage of the cluster"
  type        = string
}

variable "main_task_definition_cpu" {
  description = "CPU for the main task definition"
  type        = number
}

variable "main_task_definition_memory" {
  description = "Memory for the main task definition"
  type        = number
}

variable "ecs_task_execution_role" {
  description = "ECS task execution role"
  type        = string
}

variable "main_container_difinitions_cpu" {
  description = "CPU for the main container definition"
  type        = string
}

variable "main_container_difinitions_memory" {
  description = "Memory for the main container definition"
  type        = string
}

variable "main_containerPort" {
  description = "Port for the container"
  type        = number
}

variable "main_container_command" {
  description = "Command for the container"
  type        = list(string)

}

variable "ecr_lifecycle_policy_document" {
  description = "Lifecycle policy for the ECR"
  type        = string
}

variable "private_subnets" {
  description = "Private subnets"
  type        = list(string)
}

variable "private_main_security_group" {
  description = "Security group for the main service"
  type        = string
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "main_alb_target_group_arn" {
  description = "ARN of the target group"
  type        = string
}