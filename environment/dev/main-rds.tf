# module "rds" {

#   source = "../../modules/rds"

#   project_name               = local.project_name
#   stage                      = local.stage
#   security_group_ids         = [module.networking.db_security_group_id]
#   vpc_id                     = module.networking.vpc.id
#   subnet_ids                 = [module.networking.db_subnet_1, module.networking.db_subnet_2, module.networking.db_subnet_3]
#   engine_version             = "16.1"
#   instance_type              = "db.t3.medium"
#   database_username          = "luanleite"
#   database_password          = random_password.db_password.result
#   database_name              = "testdb"
#   storage_encrypted          = true
#   backup_retention_period    = 30
#   maintenance_window         = "Mon:00:00-Mon:01:00"
#   rds_secrets_name           = "${local.stage}-${local.project_name}-rds-secrets"
#   auto_minor_version_upgrade = false
#   deletion_protection        = true

# }

# resource "random_password" "db_password" {
#   length  = 16
#   special = false
# }