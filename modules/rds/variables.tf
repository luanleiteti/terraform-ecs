variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "stage" {
  description = "Stage of the cluster"
  type        = string
}


variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs"
}

variable "engine_version" {
  type        = string
  description = "value of the engine version"
}

variable "instance_type" {
  type        = string
  description = "value of the instance type"
}

variable "database_username" {
  description = "Database username"
  type        = string
}

variable "database_password" {
  description = "Database password"
  type        = string
}

variable "database_name" {
  description = "Database name"
  type        = string
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = 30
}

variable "maintenance_window" {
  description = "The window to perform maintenance in"
  type        = string
  default     = "Mon:00:00-Mon:01:00"
}

variable "security_group_ids" {
  type = list(string)
}


variable "rds_secrets_name" {
  type        = string
  description = "Name of the RDS secrets"
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "Auto minor version upgrade"
  default     = false

}

variable "deletion_protection" {
  type        = bool
  description = "Deletion protection"
  default     = true
}
