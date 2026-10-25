
# Backend Server SG
resource "aws_security_group" "backend_server" {
  name        = "backend-server-sg"
  description = "Allow SSH + HTTP for backend servers"
  vpc_id      = var.vpc_id

  ingress = [
    for port in [22, 80] : {
      description      = "Allow SSH/HTTP"
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
    Name = "backend-server-sg"
  }
}