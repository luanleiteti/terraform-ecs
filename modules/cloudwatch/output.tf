output "cloudwatch_ecs_log_group_name" {
    value = aws_cloudwatch_log_group.main_ecs_log_group.name
}