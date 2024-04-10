resource "aws_s3_bucket" "main_alb_bucket_logs" {
  bucket = "${var.stage}-${var.project_name}-alb-logs"
}

resource "aws_s3_bucket_public_access_block" "main_alb_bucket_block_public_access" {
  bucket = aws_s3_bucket.main_alb_bucket_logs.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main_alb_bucket_sse" {
  bucket = aws_s3_bucket.main_alb_bucket_logs.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}