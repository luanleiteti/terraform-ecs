module "ecs" {
  source       = "../../modules/ecs"
  stage        = local.stage
  project_name = local.project_name
  # cloudwatch_ecs_log_group_name = module.cloudwatch.cloudwatch_ecs_log_group_name
  # main_ecs_logs_bucket = module.s3.main_ecs_logs_bucket
  subnet_ids = [module.networking.private_subnet_1, module.networking.private_subnet_2]
  max_size = 3
  min_size = 1
  desired_capacity = 1
  ecs_instance_type = "t2.micro"
  ecs_key_name = "key-test.pem"
  security_group_ids = module.networking.private_security_group_id
  grace_period = 300
  health_check_type = "EC2"
  default_cooldown = 300
  default_instance_warmup = 60

}