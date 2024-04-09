output "ecs_cluster" {
   value = aws_ecs_cluster.main_cluster_ecs
}

output "aws_autoscaling_group" {
  value = aws_autoscaling_group.main_asg_ecs
}