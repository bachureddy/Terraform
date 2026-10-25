variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "region" {
  description = "The AWS region for the frontend load balancer"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group for the frontend load balancer"
  type        = string
}

variable "subnets" {
  description = "The list of subnets for the frontend load balancer"
  type        = list(string)
}

variable "alb_name" {
  description = "The name of the frontend application load balancer"
  type        = string
}

variable "target_group_name" {
  description = "The name of the frontend target group"
  type        = string
}


