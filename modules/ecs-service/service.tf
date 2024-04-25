resource "aws_ecs_task_definition" "main_task_definition" {
  family                   = "${var.stage}-${var.project_name}-ecs-task"
  network_mode             = "bridge"
  cpu                      = var.main_task_definition_cpu
  memory                   = var.main_task_definition_memory
  requires_compatibilities = ["EC2"]
  execution_role_arn       = var.ecs_task_execution_role
  task_role_arn            = var.ecs_task_execution_role
  container_definitions    = templatefile("${path.module}/container_definitions/definitions.json.tpl", local.container)

}

resource "aws_ecs_service" "main_service" {
  name                 = "${var.stage}-${var.project_name}-ecs-service"
  cluster              = var.ecs_cluster_name
  task_definition      = aws_ecs_task_definition.main_task_definition.arn
  desired_count        = 1
  force_new_deployment = true
  scheduling_strategy  = "REPLICA"
  load_balancer {
    target_group_arn = var.main_alb_target_group_arn
    container_name   = local.container.application_name
    container_port   = local.container.application_port
  }

  ordered_placement_strategy {
    type  = "binpack"
    field = "memory"
  }

  ordered_placement_strategy {
    type  = "spread"
    field = "attribute:ecs.availability-zone"
  }

  lifecycle {
    ignore_changes = [task_definition]
  }

  capacity_provider_strategy {
    capacity_provider = var.capacity_provider
    weight            = 1
  }

  deployment_controller {
    type = "CODE_DEPLOY"

  }
}