resource "aws_ecs_task_definition" "main_task_definition" {
  family                   = "${var.stage}-${var.project_name}-ecs-task"
  network_mode             = "awsvpc"
  cpu                      = var.main_task_definition_cpu
  memory                   = var.main_task_definition_memory
  requires_compatibilities = ["EC2"]
  execution_role_arn       = var.ecs_task_execution_role
  task_role_arn            = var.ecs_task_execution_role
  container_definitions    = templatefile("${path.module}/container_definitions/definitions.json.tpl", locals.container)

}