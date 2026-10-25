output "backend_instance_id" {
  description = "The ID of the backend EC2 instance"
  value       = aws_instance.backend.id
}

output "backend_instance_public_ip" {
  description = "The public IP address of the backend EC2 instance"
  value       = aws_instance.backend.public_ip
}

output "backend_instance_private_ip" {
  description = "The private IP address of the backend EC2 instance"
  value       = aws_instance.backend.private_ip
}