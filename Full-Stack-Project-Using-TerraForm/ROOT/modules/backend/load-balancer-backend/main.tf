# target group for the backend load balancer    

resource "aws_lb_target_group" "backend" {
  name     = "${var.project_name}-backend-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}
resource "aws_lb" "backend" {
  name               = "${var.project_name}-backend-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.backend_sg_id]
  subnets            = var.subnet_ids

  tags = {
    Name = "${var.project_name}-backend-lb"
  }
  depends_on = [aws_lb_target_group.backend]
}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.backend.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }
  depends_on = [aws_lb_target_group.backend]
}