resource "aws_autoscaling_group" "main_asg_ecs" {
  name = "${var.stage}-${var.project_name}-ecs-asg"

  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.grace_period
  health_check_type         = var.health_check_type
  default_cooldown          = var.default_cooldown
  default_instance_warmup   = var.default_instance_warmup
  termination_policies      = ["OldestInstance"]
  vpc_zone_identifier       = var.subnet_ids
  target_group_arns         = var.target_group_arns

  launch_template {
    id      = aws_launch_template.main_launch_template_ecs.id
    version = aws_launch_template.main_launch_template_ecs.latest_version
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }

  tag {
    key                 = "Name"
    value               = "${var.stage}-${var.project_name}-ecs-asg"
    propagate_at_launch = true
  }
}

