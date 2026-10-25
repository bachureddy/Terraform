output "vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.three_tier.id
}

output "default_security_group_id" {
  description = "The default security group ID for the VPC"
  value       = aws_vpc.three_tier.default_security_group_id
}

output "public_subnet_1_id" {
  description = "The first public subnet ID"
  value       = aws_subnet.pub1.id
}

output "public_subnet_2_id" {
  description = "The second public subnet ID"
  value       = aws_subnet.pub2.id
}

output "private_subnet_1_id" {
  description = "The first private subnet ID"
  value       = aws_subnet.prvt1.id
}

output "private_subnet_2_id" {
  description = "The second private subnet ID"
  value       = aws_subnet.prvt2.id
}

output "public_subnets" {
  description = "All public subnet IDs"
  value       = [aws_subnet.pub1.id, aws_subnet.pub2.id]
}

output "private_app_subnets" {
  description = "Private application subnet IDs"
  value       = [aws_subnet.prvt3.id, aws_subnet.prvt4.id]
}

output "private_db_subnets" {
  description = "Private database subnet IDs"
  value       = [aws_subnet.prvt5.id, aws_subnet.prvt6.id]
}

output "database_sg_id" {
  description = "The database security group ID"
  value       = aws_security_group.database.id
}

output "frontend_alb_sg_id" {
  description = "The frontend ALB security group ID"
  value       = aws_security_group.frontend_alb.id
}

output "frontend_server_sg_id" {
  description = "The frontend server security group ID"
  value       = aws_security_group.frontend_server.id
}

output "backend_alb_sg_id" {
  description = "The backend ALB security group ID"
  value       = aws_security_group.backend_alb.id
}

output "backend_server_sg_id" {
  description = "The backend server security group ID"
  value       = aws_security_group.backend_server.id
}
