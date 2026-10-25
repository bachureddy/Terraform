output "frontend_instance_id" {
  description = "The ID of the frontend EC2 instance"
  value       = aws_instance.frontend.id
}

output "frontend_instance_public_ip" {
  description = "The public IP address of the frontend EC2 instance"
  value       = aws_instance.frontend.public_ip
}

output "frontend_instance_private_ip" {
  description = "The private IP address of the frontend EC2 instance"
  value       = aws_instance.frontend.private_ip
}