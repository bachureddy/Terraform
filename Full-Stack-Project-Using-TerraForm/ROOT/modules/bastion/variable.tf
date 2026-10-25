variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "subnet_id" {
  description = "The subnet ID for the bastion host"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "The key pair name for SSH access to the bastion host"
  type        = string
  default     = ""
}

variable "ami" {
  description = "The AMI ID for the bastion host"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID for your region
}

variable "instance_type" {
  description = "The instance type for the bastion host"
  type        = string
  default     = "t2.micro"
}

variable "security_group_id" {
  description = "The security group ID for the bastion host"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The VPC ID where the bastion host will be deployed"
  type        = string
  default     = ""
}

variable "ssh_cidr_blocks" {
  description = "The CIDR blocks allowed to access the bastion host via SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}   

variable "http_cidr_blocks" {
  description = "The CIDR blocks allowed to access the bastion host via HTTP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "vpc_name" {
  description = "The name of the VPC where the bastion host will be deployed"
  type        = string
  default     = ""
}