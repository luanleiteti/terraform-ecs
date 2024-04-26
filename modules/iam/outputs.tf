output "ecs_main_role" {
  value = aws_iam_role.ecs
}

output "ec2_main_role" {
  value = aws_iam_role.ec2
}

output "aws_iam_instance_profile" {
  value = aws_iam_instance_profile.ec2
}

output "ecs_task_execution_role" {
  value = aws_iam_role.ecs_task_execution_role
}

output "ecr_lifecycle_policy_document" {
  value = data.aws_ecr_lifecycle_policy_document.ecr_lifecycle_policy_document
}

output "codedeploy_role" {
  value = aws_iam_role.codedeploy_role
}

output "sns_topic_policy_document" {
  value = data.aws_iam_policy_document.main_sns_topic_policy
}

output "main_ecs_service_role" {
  value = aws_iam_role.main_ecs_service_role
}