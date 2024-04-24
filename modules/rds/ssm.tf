resource "aws_ssm_parameter" "rds_address" {
  name  = "/ECS-CLUSTER/${var.stage}-${var.project_name}/RDS_ADDRESS"
  type  = "String"
  value = aws_rds_cluster.main_postgresql.endpoint
}

resource "aws_ssm_parameter" "rds_db" {
  name  = "/ECS-CLUSTER/${var.stage}-${var.project_name}/RDS_DATABASE"
  type  = "String"
  value = var.database_name
}

resource "aws_secretsmanager_secret" "rds_secrets" {
  name = var.rds_secrets_name
}

locals {
  rds_secret = {
    username     = var.database_username,
    password     = var.database_password
    database_url = "postgres://${var.database_username}:${var.database_password}@${aws_rds_cluster.main_postgresql.endpoint}/${var.database_name}"
  }
}

resource "aws_secretsmanager_secret_version" "rds_secret" {
  secret_id     = aws_secretsmanager_secret.rds_secrets.id
  secret_string = jsonencode(local.rds_secret)
}
