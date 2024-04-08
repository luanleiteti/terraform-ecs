module "kms" {
  
  source = "../../modules/kms"
  stage  = local.stage
  project_name = local.project_name
  s3_main_kms_key_policy = module.iam.s3_main_kms_key_policy.policy
  ecs_main_kms_key_policy = module.iam.ecs_main_kms_key_policy.policy
  cloudwatch_logs_main_kms_key_policy = module.iam.cloudwatch_logs_main_kms_key_policy.policy

}
