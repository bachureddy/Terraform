variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "public_subnet_1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
  default     = ""
}

variable "public_subnet_2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
  default     = ""
}

variable "private_subnet_1_cidr" {
  description = "The CIDR block for the first private subnet"
  type        = string
  default     = ""
}

variable "private_subnet_2_cidr" {
  description = "The CIDR block for the second private subnet"
  type        = string
  default     = ""
}

variable "private_subnet_3_cidr" {
  description = "The CIDR block for the third private subnet"
  type        = string
  default     = ""
}

variable "private_subnet_4_cidr" {
  description = "The CIDR block for the fourth private subnet"
  type        = string
  default     = ""
}

variable "private_subnet_5_cidr" {
  description = "The CIDR block for the fifth private subnet"
  type        = string
  default     = ""
}

variable "private_subnet_6_cidr" {
  description = "The CIDR block for the sixth private subnet"
  type        = string
  default     = ""
}

variable "availability_zone_1a" {
  description = "The availability zone for the first set of subnets"
  type        = string
  default     = ""
}

variable "availability_zone_1b" {
  description = "The availability zone for the second set of subnets"
  type        = string
  default     = ""
}
