resource "aws_cloudwatch_log_group" "main_ecs_log_group" {
  name = "${var.stage}-${var.project_name}-ecs-log-group"

    retention_in_days = 14
    skip_destroy = true
    log_group_class = "STANDARD"
    kms_key_id = var.main_cloudwatch_logs_kms_key
}