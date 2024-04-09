module "ecs-service" {
  source                            = "../../modules/ecs-service"
  stage                             = local.stage
  project_name                      = local.project_name
  ecs_task_execution_role           = module.iam.ecs_task_execution_role.arn
  main_task_definition_cpu          = 500
  main_task_definition_memory       = 256
  main_container_difinitions_cpu    = 500
  main_container_difinitions_memory = 256
  main_container_command            = ["./python", "app.py"]
  main_containerPort                = 80


}