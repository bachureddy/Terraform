variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}
variable "frontend_desired_capacity" {
  description = "The desired capacity for the frontend auto scaling group"
  type        = number
}
variable "frontend_min_size" {
  description = "The minimum size for the frontend auto scaling group"
  type        = number
}
variable "frontend_max_size" {
  description = "The maximum size for the frontend auto scaling group"
  type        = number
}
variable "scale_out_target_value" {
  description = "The target value for the frontend scale out policy"
  type        = number
  default     = 80
}
variable "frontend_launch_template_id" {
  description = "The ID of the launch template for the frontend auto scaling group"
  type        = string
}
variable "web_subnet_1" {
  description = "The ID of the first web subnet for the frontend auto scaling group"
  type        = string
}
variable "web_subnet_2" {
  description = "The ID of the second web subnet for the frontend auto scaling group"
  type        = string
}
variable "frontend_target_group_arn" {
  description = "The ARN of the frontend target group"
  type        = string
}