variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "stage" {
  description = "Stage of the cluster"
  type        = string
}

variable "internal" {
  description = "Internal or external load balancer"
  type        = bool

}

variable "main_private_subnets_id" {
  description = "Subnets to deploy the load balancer"
  type        = list(string)
}

variable "main_alb_security_group_id" {
  description = "Security group to deploy the load balancer"
  type        = string
}

variable "domain_name" {
  description = "Domain name to create the certificate"
  type        = string
}

variable "load_balancer_type" {
  description = "Type of the load balancer"
  type        = string
  default     = "application"
}

variable "main_alb_target_group_arn" {
  description = "ARN of the target group"
  type        = string

}

variable "main_alb_target_group_green_arn" {
  description = "ARN of the target group"
  type        = string

}
