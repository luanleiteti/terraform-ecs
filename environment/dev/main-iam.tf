module "iam" {
  source                    = "../../modules/iam"
  stage                     = local.stage
  project_name              = local.project_name
  main_alb_bucket_logs_arn  = module.alb.main_alb_bucket_logs.arn
  main_alb_bucket_logs_name = module.alb.main_alb_bucket_logs.bucket
}
