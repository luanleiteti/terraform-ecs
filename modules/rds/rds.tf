data "aws_availability_zones" "available_zones" {
  state = "available"
}

resource "aws_rds_cluster" "main_postgresql" {
  cluster_identifier              = "${var.stage}-${var.project_name}-rds-cluster"
  engine                          = "aurora-postgresql"
  engine_version                  = var.engine_version
  availability_zones              = [local.availability_zone[0], local.availability_zone[1], local.availability_zone[2]]
  master_username                 = var.database_username
  master_password                 = var.database_password
  database_name                   = var.database_name
  storage_encrypted               = var.storage_encrypted
  backup_retention_period         = var.backup_retention_period
  preferred_maintenance_window    = var.maintenance_window
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.main_rds_cluster_parameter_group.name
  db_subnet_group_name            = aws_db_subnet_group.main_db_subnet_group.id
  vpc_security_group_ids          = var.security_group_ids
  apply_immediately               = true
  skip_final_snapshot             = true
  deletion_protection             = var.deletion_protection
  # snapshot_identifier             = "${var.stage}-${var.project_name}-rds-cluster-final-snapshot-final-snapshot"

  tags = {
    Name = "${var.stage}-${var.project_name}-rds-cluster"
  }
}

resource "aws_rds_cluster_instance" "cluster_instance_reader" {
  identifier                 = "${var.stage}-${var.project_name}-rds-cluster-instance-reader"
  cluster_identifier         = aws_rds_cluster.main_postgresql.id
  instance_class             = var.instance_type
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  engine                     = aws_rds_cluster.main_postgresql.engine
  engine_version             = aws_rds_cluster.main_postgresql.engine_version


  lifecycle {
    ignore_changes = [engine_version]
  }
}

resource "aws_rds_cluster_instance" "cluster_instance_writter" {
  identifier                 = "${var.stage}-${var.project_name}-rds-cluster-instance-writter"
  cluster_identifier         = aws_rds_cluster.main_postgresql.id
  instance_class             = var.instance_type
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  engine                     = aws_rds_cluster.main_postgresql.engine
  engine_version             = aws_rds_cluster.main_postgresql.engine_version


  lifecycle {
    ignore_changes = [engine_version]
  }
}
#TODO: add the parameter group variable
resource "aws_rds_cluster_parameter_group" "main_rds_cluster_parameter_group" {
  name        = "${var.stage}-${var.project_name}-rds-cluster-pg"
  family      = "aurora-postgresql16"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "client_encoding"
    value = "utf8"
  }
}

resource "aws_db_subnet_group" "main_db_subnet_group" {
  name       = "${var.stage}-${var.project_name}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.stage}-${var.project_name}-Database Subnet Group"
  }
}

### create ssm parameter with the rds cluster endpoint
resource "aws_ssm_parameter" "rds_cluster_address" {
  name        = var.rds_secrets_name
  description = "${var.stage}-${var.project_name}-RDS  cluster endpoint"
  type        = "String"
  value       = aws_rds_cluster.main_postgresql.endpoint
}
