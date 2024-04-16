module "ecs_service" {
  source                            = "../../modules/ecs-service"
  stage                             = local.stage
  project_name                      = local.project_name
  ecs_task_execution_role           = module.iam.ecs_task_execution_role.arn
  main_task_definition_cpu          = 500
  main_task_definition_memory       = 256
  main_container_difinitions_cpu    = 500
  main_container_difinitions_memory = 256
  main_containerPort                = 80
  ecr_lifecycle_policy_document     = module.iam.ecr_lifecycle_policy_document.json
  private_subnets                   = [module.networking.private_subnet_1, module.networking.private_subnet_2, module.networking.private_subnet_3]
  private_main_security_group       = module.networking.private_security_group_id
  ecs_cluster_name                  = module.ecs.ecs_cluster.name
  main_alb_target_group_arn         = module.target_group.main_alb_target_group.arn
  capacity_provider                 = module.ecs.capacity_provider.name
  health_check_command              = ["CMD-SHELL", "curl -f http://localhost:80/healthcheck || exit 1"]
  health_check_interval             = 5
  health_check_timeout              = 3
  health_check_start_period         = 60
  health_check_retries              = 4
  load_balancer_id                  = module.alb.main_alb.arn_suffix
  target_group_id                   = module.target_group.main_alb_target_group.arn_suffix

}