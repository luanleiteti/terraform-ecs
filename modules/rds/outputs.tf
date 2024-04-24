output "cluster_rds_instace_identifier_reader" {
  value = aws_rds_cluster_instance.cluster_instance_reader
}

output "cluster_rds_instace_identifier_writter" {
  value = aws_rds_cluster_instance.cluster_instance_writter
}

output "secret_arn" {
  value = aws_secretsmanager_secret.rds_secrets.arn
}

output "aws_rds_cluster" {
  value = aws_rds_cluster.main_postgresql
}
