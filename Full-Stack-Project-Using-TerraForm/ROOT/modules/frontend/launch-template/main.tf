resource "aws_ami_from_instance" "ami-frontend" {
  name = "ami-frontend"
  source_instance_id = var.instance_id
  snapshot_without_reboot = false
  tags = {
    Name = "ami-frontend"
  }
}

resource "aws_launch_template" "frontend" {
  name          = "${var.project_name}-frontend-launch-template"
  image_id      = aws_ami_from_instance.ami-frontend.id
  instance_type = var.instance_type
  description   = "Frontend launch template"
  vpc_security_group_ids = [var.frontend_sg_id]
  key_name = var.key_name
  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project_name}-frontend-instance"
    }
  }
}

