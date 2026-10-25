# ALB Backend SG
resource "aws_security_group" "alb_backend" {
  name        = "alb-backend-sg"
  description = "Allow HTTP/HTTPS for backend"
  vpc_id      = var.vpc_id

  ingress = [
    for port in [80, 443] : {
      description      = "Allow HTTP/HTTPS"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-backend-sg"
  }
}