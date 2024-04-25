module "alb" {
  source                          = "../../modules/load-balancer"
  project_name                    = local.project_name
  stage                           = local.stage
  internal                        = true
  main_private_subnets_id         = [module.networking.private_subnet_1, module.networking.private_subnet_2, module.networking.private_subnet_3]
  main_alb_security_group_id      = module.networking.alb_security_group_id
  domain_name                     = local.domain_name
  main_alb_target_group_arn       = module.target_group.main_alb_target_group.arn
  main_alb_target_group_green_arn = module.target_group.main_alb_target_group_green.arn
}