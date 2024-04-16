module "target_group" {
  source             = "../../modules/target-group"
  stage              = local.stage
  project_name       = local.project_name
  vpc_id             = module.networking.vpc.id
  health_check       = "/healthcheck"
  main_containerPort = 80
  main_alb_id        = module.alb.main_alb.arn
}