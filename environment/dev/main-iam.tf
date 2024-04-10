module "iam" {
  source                   = "../../modules/iam"
  stage                    = local.stage
  project_name             = local.project_name
  main_alb_bucket_logs_arn = module.target_group.main_alb_target_group.arn
}
