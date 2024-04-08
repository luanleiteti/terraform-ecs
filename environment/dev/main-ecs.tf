module "ecs" {
  source                  = "../../modules/ecs"
  stage                   = local.stage
  project_name            = local.project_name
  subnet_ids              = [module.networking.private_subnet_1, module.networking.private_subnet_2]
  max_size                = 3
  min_size                = 1
  desired_capacity        = 1
  ecs_instance_type       = "t2.micro"
  ecs_key_name            = "key-test"
  security_group_ids      = module.networking.private_security_group_id
  grace_period            = 300
  health_check_type       = "EC2"
  default_cooldown        = 300
  default_instance_warmup = 60
  ecs_volume_size         = 50
  aws_iam_instance_profile = module.iam.aws_iam_instance_profile.name
  main_ecs_kms_key_id = module.kms.ecs_kms_key.id
  main_ecs_log_group = module.cloudwatch.cloudwatch_ecs_log_group_name.name
  main_s3_logs_bucket = module.s3.main_ecs_logs_bucket.id

}