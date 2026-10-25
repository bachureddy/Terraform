output "frontend_alb_dns_name" {
  description = "Public DNS name for the frontend application"
  value       = module.frontend-alb.alb_dns_name
}

output "backend_alb_dns_name" {
  description = "Private DNS name for the backend application load balancer"
  value       = module.backend-alb.backend_lb_dns_name
}
