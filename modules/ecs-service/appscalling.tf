resource "aws_appautoscaling_target" "main_ecs_target_service" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "service/${var.ecs_cluster_name}/${aws_ecs_service.main_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "main_ecs_policy_scale_per_cpu" {
  name               = "${var.stage}-${var.project_name}-scale-per-cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.main_ecs_target_service.resource_id
  scalable_dimension = aws_appautoscaling_target.main_ecs_target_service.scalable_dimension
  service_namespace  = aws_appautoscaling_target.main_ecs_target_service.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown  = 60
    scale_out_cooldown = 60
    target_value       = 80.0
  }
}

resource "aws_appautoscaling_policy" "main_ecs_policy_scale_per_memory" {
  name               = "${var.stage}-${var.project_name}-scale-per-memory"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.main_ecs_target_service.resource_id
  scalable_dimension = aws_appautoscaling_target.main_ecs_target_service.scalable_dimension
  service_namespace  = aws_appautoscaling_target.main_ecs_target_service.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
    scale_in_cooldown  = 60
    scale_out_cooldown = 60
    target_value       = 80.0
  }
}

resource "aws_appautoscaling_policy" "main_ecs_policy_scale_per_request" {
  name               = "${var.stage}-${var.project_name}-scale-per-request"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.main_ecs_target_service.resource_id
  scalable_dimension = aws_appautoscaling_target.main_ecs_target_service.scalable_dimension
  service_namespace  = aws_appautoscaling_target.main_ecs_target_service.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      resource_label         = "${var.load_balancer_id}/${var.target_group_id}"
      predefined_metric_type = "ALBRequestCountPerTarget"
    }
    scale_in_cooldown  = 60
    scale_out_cooldown = 60
    target_value       = 100.0
  }
}