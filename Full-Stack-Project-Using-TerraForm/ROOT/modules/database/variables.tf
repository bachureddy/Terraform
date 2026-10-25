variable "region" {
  description = "The AWS region for the RDS instance"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "three-tier"
}
variable "identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}
variable "allocated_storage" {
  description = "The allocated storage for the RDS instance in GB"
  type        = number
  default     = 20
}
variable "engine" {
  description = "The database engine for the RDS instance"
  type        = string
  default     = "mysql"
}
variable "engine_version" {
  description = "The version of the database engine for the RDS instance"
  type        = string
  default     = "8.0"
}
variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}
variable "multi_az" {
  description = "Whether the RDS instance is multi-AZ"
  type        = bool
  default     = false
}
variable "db_name" {
  description = "The name of the database for the RDS instance"
  type        = string

}
variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
}
variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
 sensitive = true
}
variable "rds_sg_id" {
  description = "The security group ID for the RDS instance"
  type        = string
  default     = ""
}
variable "db_subnet_1_id" {
  description = "The first subnet ID for the RDS instance"
  type        = string
  default     = ""
}
variable "db_subnet_2_id" {
  description = "The second subnet ID for the RDS instance"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The VPC ID for the RDS instance"
  type        = string
}
