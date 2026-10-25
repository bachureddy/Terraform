resource "aws_autoscaling_group" "backend_asg" {
  name_prefix          = "${var.project_name}-backend-asg-"
  desired_capacity     = var.desired_capacity
  min_size             = var.min_size
  max_size             = var.max_size
  vpc_zone_identifier  = [var.app_subnet_1, var.app_subnet_2]
  target_group_arns    = [var.backend_target_group_arn]
  health_check_type    = "EC2"
  health_check_grace_period = 300

  launch_template {
    id      = var.backend_launch_template_id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-backend-asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "backend_scale_out" {
  name                   = "${var.project_name}-backend-scale-out"
  autoscaling_group_name = aws_autoscaling_group.backend_asg.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value     = var.scale_out_target_value
    disable_scale_in = false
  }
}
