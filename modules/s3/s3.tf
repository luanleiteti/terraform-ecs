resource "aws_s3_bucket" "main_ecs_logs_bucket" {
  bucket = "${var.stage}-${var.project_name}-ecs-logs-bucket"
}