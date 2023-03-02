variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "stage" {
  description = "Stage of the cluster"
  type        = string
}

variable "cidr_ip_block" {
  description = "CIDI of the cluster"
  type        = string
  default = "10.10.0.0/16"
}

variable "ip_subnet_1"{
    description = "IP subnet 1"
    type        = string
    default     = "10.10.30.0"
}

variable "ip_subnet_2"{
    description = "IP subnet 2"
    type        = string
    default     = "10.10.40.0"
}

variable "ip_subnet_3"{
    description = "IP subnet 3"
    type        = string
    default     = "10.10.10.0"
}

variable "ip_subnet_4"{
    description = "IP subnet 4"
    type        = string
    default     = "10.10.20.0"
}