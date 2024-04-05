resource "aws_s3_bucket" "main_ecs_logs_bucket" {
  bucket = "${var.stage}-${var.project_name}-ecs-logs-bucket"
}

resource "aws_s3_bucket_public_access_block" "main_ecs_logs_bucket_public_access_block" {
  bucket = aws_s3_bucket.main_ecs_logs_bucket.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main_ecs_logs_bucket_sse" {
  bucket = aws_s3_bucket.main_ecs_logs_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
      kms_master_key_id = var.main_s3_kms_key
    }
  }
  
}