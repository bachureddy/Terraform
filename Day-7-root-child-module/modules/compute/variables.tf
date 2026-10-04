variable "ami" {
  description = "The AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the instance"
  type        = string
}



variable "subnet_id" {
  description = "The ID of the subnet for the instance"
  type        = string
}

variable "instance_tags" {
  description = "A map of tags to assign to the instance"
  type        = map(string)
}