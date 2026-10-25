variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "instance_id" {
  description = "The ID of the source instance for the AMI"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the backend EC2 instance"
  type        = string
}

variable "backend_sg_id" {
  description = "The security group ID for the backend EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The key pair name for the backend EC2 instance"
  type        = string
}
