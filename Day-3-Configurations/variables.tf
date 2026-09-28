variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "subnet_cidr" {
    description = "The CIDR block for the subnet"
    type        = string
    default     = ""
}

variable "instance_type" {
    description = "The type of instance to create"
    type        = string
    default     = ""
}