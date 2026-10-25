resource "aws_ami_from_instance" "backend" {
  name                    = "${var.project_name}-backend-ami"
  source_instance_id      = var.instance_id
  snapshot_without_reboot = false
}

resource "aws_launch_template" "backend" {
  name                   = "${var.project_name}-backend-launch-template"
  image_id               = aws_ami_from_instance.backend.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.backend_sg_id]
  key_name               = var.key_name
  update_default_version = true

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project_name}-backend-instance"
    }
  }

  depends_on = [aws_ami_from_instance.backend]
}