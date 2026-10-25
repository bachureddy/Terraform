variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "region" {
  description = "The AWS region for the backend EC2 instance"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The ID of the AMI for the backend EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the backend EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The EC2 key pair name for SSH access to the backend instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet for the backend EC2 instance"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group for the backend EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC for the backend EC2 instance"
  type        = string
}