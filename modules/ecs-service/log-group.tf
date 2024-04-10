resource "aws_cloudwatch_log_group" "main_service_ecs_log_group" {
  name              = "${var.stage}-${var.project_name}-ecs-service-log-group"
  retention_in_days = 30
  log_group_class   = "STANDARD"
}