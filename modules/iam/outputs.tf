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