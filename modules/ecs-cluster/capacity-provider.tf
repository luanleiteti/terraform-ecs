resource "aws_ecs_capacity_provider" "main_capacity_provider" {
  name = "${var.stage}-${var.project_name}-ecs-capacity-provider"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.main_asg_ecs.arn
    managed_scaling {
      status                    = "ENABLED"
      maximum_scaling_step_size = var.max_size
      minimum_scaling_step_size = var.min_size
      target_capacity           = 100
    }

    managed_draining = "DISABLED"

    managed_termination_protection = "DISABLED"
  }

}

resource "aws_ecs_cluster_capacity_providers" "main_cluster_capacity_providers" {
  cluster_name       = aws_ecs_cluster.main_cluster_ecs.name
  capacity_providers = [aws_ecs_capacity_provider.main_capacity_provider.name]
  default_capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.main_capacity_provider.name
    weight            = 100
    base              = 1
  }

}