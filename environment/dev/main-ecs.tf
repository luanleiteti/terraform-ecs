module "ecs" {
  source                   = "../../modules/ecs-cluster"
  stage                    = local.stage
  project_name             = local.project_name
  subnet_ids               = [module.networking.private_subnet_1, module.networking.private_subnet_2, module.networking.private_subnet_3]
  max_size                 = 3
  min_size                 = 1
  desired_capacity         = 1
  ecs_instance_type        = "t2.micro"
  ecs_key_name             = "key-test"
  security_group_ids       = module.networking.private_security_group_id
  grace_period             = 300
  health_check_type        = "EC2"
  default_cooldown         = 300
  default_instance_warmup  = 60
  ecs_volume_size          = 50
  aws_iam_instance_profile = module.iam.aws_iam_instance_profile.name
  # target_group_arns        = [module.target_group.main_alb_target_group.arn]

}