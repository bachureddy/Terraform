variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "backend_sg_id" {
  description = "The security group ID for the backend"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs for the backend load balancer"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID for the backend load balancer"
  type        = string
}

variable "alb_name" {
  description = "Name of the ALB"
  type        = string
  default     = "backend-alb"
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
  default     = "backend-tg"
}