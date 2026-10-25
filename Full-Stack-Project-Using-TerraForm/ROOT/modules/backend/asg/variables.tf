variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "backend_launch_template_id" {
  description = "The ID of the backend launch template"
  type        = string
}

variable "app_subnet_1" {
  description = "The first private application subnet ID"
  type        = string
}

variable "app_subnet_2" {
  description = "The second private application subnet ID"
  type        = string
}

variable "backend_target_group_arn" {
  description = "The ARN of the backend target group"
  type        = string
}

variable "desired_capacity" {
  description = "Desired backend autoscaling capacity"
  type        = number
}

variable "min_size" {
  description = "Minimum backend autoscaling size"
  type        = number
}

variable "max_size" {
  description = "Maximum backend autoscaling size"
  type        = number
}

variable "scale_out_target_value" {
  description = "Target CPU utilization for autoscaling"
  type        = number
  default     = 80
}
