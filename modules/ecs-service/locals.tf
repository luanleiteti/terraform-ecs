locals {
  container = {
    application_name   = "${var.stage}-${var.project_name}-container-app"
    container_command  = [var.main_container_command]
    ecr_url            = aws_ecr_repository.main_ecr_serivce_ecs.repository_url
    cpu_reservation    = var.main_container_difinitions_cpu
    memory_reservation = var.main_container_difinitions_memory
    host_port          = 0
    application_port   = var.main_containerPort
    log_group          = aws_cloudwatch_log_group.main_service_ecs_log_group.name
    aws_region         = data.aws_region.current.name
    # secret_arn         = var.secret_arn
  }
}