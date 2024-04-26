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

variable "capacity_provider" {
  description = "Capacity provider"
  type        = string
}

variable "health_check_command" {
  description = "Command for the health check"
  type        = list(string)
}

variable "health_check_interval" {
  description = "Interval for the health check"
  type        = number
}

variable "health_check_timeout" {
  description = "Timeout for the health check"
  type        = number
}

variable "health_check_retries" {
  description = "Retries for the health check"
  type        = number
}

variable "health_check_start_period" {
  description = "Start period for the health check"
  type        = number
}

variable "load_balancer_id" {
  description = "ID of the load balancer"
  type        = string

}
variable "target_group_id" {
  description = "ID of the target group"
  type        = string

}

variable "sns_topic_policy_document" {
  description = "Policy for the SNS topic"
  type        = string
}

variable "email_to_send_notifications" {
  description = "Email to send notifications"
  type        = string
}

variable "codedeploy_role_arn" {
  description = "ARN of the CodeDeploy role"
  type        = string
}

variable "main_alb_listener_https" {
  description = "ARN of the green listener"
  type        = string

}

variable "main_alb_target_group_green" {
  description = "Name of the green target group"
  type        = string
}

variable "main_alb_target_group_blue" {
  description = "Name of the blue target group"
  type        = string
}

variable "main_alb_listener_https_green" {
  description = "ARN of the green listener"
  type        = string
}

variable "ecs_service_role" {
  description = "ECS service role"
  type        = string
}