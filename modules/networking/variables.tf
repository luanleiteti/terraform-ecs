variable "region" {
  description = "AWS region"
  type        = string
}

variable "cidr_ip_block" {
  description = "CIDI of the cluster"
  type        = map
  default     = {
    dev         = "10.10"
    hml         = "10.20"
    production  = "10.30"
  }
  
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "stage" {
  description = "Stage of the cluster"
  type        = string
}