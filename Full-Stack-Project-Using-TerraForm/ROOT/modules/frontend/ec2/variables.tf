variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "ami" {
  description = "The AMI ID for the frontend EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the frontend EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The key pair name for the frontend EC2 instance"
  type        = string
}

variable "frontend_sg_id" {
  description = "The security group ID for the frontend EC2 instance"
  type        = string
}       

variable "subnet_id" {
  description = "The subnet ID for the frontend EC2 instance"
  type        = string
}


variable "vpc_id" {
  description = "The VPC ID for the frontend EC2 instance"
  type        = string
}