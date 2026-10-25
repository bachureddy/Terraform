output "alb_arn" {
  description = "The ARN of the frontend ALB"
  value       = aws_lb.frontend.arn
}

output "alb_dns_name" {
  description = "The DNS name of the frontend ALB"
  value       = aws_lb.frontend.dns_name
}

output "alb_security_group_id" {
  description = "The security group ID of the frontend ALB"
  value       = tolist(aws_lb.frontend.security_groups)[0]
}

output "alb_target_group_arn" {
  description = "The ARN of the frontend target group"
  value       = aws_lb_target_group.frontend.arn
}