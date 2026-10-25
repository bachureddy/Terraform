output "backend_lb_arn" {
  value = aws_lb.backend.arn
}

output "backend_lb_dns_name" {
  value = aws_lb.backend.dns_name
}

output "alb_target_group_arn" {
  value = aws_lb_target_group.backend.arn
}

output "backend_lb_target_group_arn" {
  value = aws_lb_target_group.backend.arn
}