resource "aws_ecs_cluster" "main_cluster_ecs" {
  name = "${var.stage}-${var.project_name}-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
