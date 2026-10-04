variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_tags" {
  description = "A map of tags to assign to the VPC"
  type        = string
}

variable "subnet_tags" {
  description = "A map of tags to assign to the subnet"
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
}