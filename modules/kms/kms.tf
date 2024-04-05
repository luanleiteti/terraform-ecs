resource "aws_kms_key" "main_ecs_kms_key" {

  description = "Main KMS key for ECS"
  deletion_window_in_days = 10
  policy = var.ecs_main_kms_key_policy
  enable_key_rotation = true
  
  tags = {
    Name = "${var.stage}-${var.project_name}-ecs-kms-key"
  }
}

resource "aws_kms_key" "main_s3_kms_key" {
  
  description = "Main KMS key for S3"
  deletion_window_in_days = 10
  policy = var.s3_main_kms_key_policy
  enable_key_rotation = true
  
  tags = {
    Name = "${var.stage}-${var.project_name}-s3-kms-key"
  }
}