module "cloudwatch" {
  source       = "../../modules/cloudwatch"
  stage        = local.stage
  project_name = local.project_name
  main_cloudwatch_logs_kms_key = module.kms.cloudwatch_logs_kms_key.id

}
