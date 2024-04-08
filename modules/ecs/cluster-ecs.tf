resource "aws_ecs_cluster" "main_cluster_ecs" {
  name = "${var.stage}-${var.project_name}-ecs-cluster"

  configuration {
    execute_command_configuration {
      kms_key_id = var.main_ecs_kms_key_id
      log_configuration {
        cloud_watch_log_group_name = var.main_ecs_log_group
        s3_bucket_name = var.main_s3_logs_bucket
        s3_key_prefix = "ecs-logs"
      }
    }
  }
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}



