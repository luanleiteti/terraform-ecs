output "s3_main_kms_key_policy" {
  value = aws_iam_policy.s3_main_kms_key_policy
}

output "ecs_main_kms_key_policy" {
  value = aws_iam_policy.ecs_main_kms_key_policy
}

output "ecs_main_role" {
  value = aws_iam_role.ecs
}

output "ec2_main_role" {
  value = aws_iam_role.ec2
}

output "aws_iam_instance_profile" {
  value = aws_iam_instance_profile.ec2
}

output "cloudwatch_logs_main_kms_key_policy" {
  value = aws_iam_policy.cloudwatch_logs_main_kms_key_policy
}