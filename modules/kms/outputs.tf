output "ecs_kms_key" {
  value = aws_kms_key.main_ecs_kms_key
  
}

output "s3_kms_key" {
  value = aws_kms_key.main_s3_kms_key
}

output "cloudwatch_logs_kms_key" {
  value = aws_kms_key.main_cloudwatch_logs_kms_key
  
}