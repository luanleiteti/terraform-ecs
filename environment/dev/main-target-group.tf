module "target_group" {
  source             = "../../modules/target-group"
  stage              = local.stage
  project_name       = local.project_name
  vpc_id             = module.networking.vpc.id
  health_check       = "/"
  main_containerPort = 80
}