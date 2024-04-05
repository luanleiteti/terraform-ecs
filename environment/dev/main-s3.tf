module "s3" {

  source = "../../modules/s3"

  stage        = local.stage
  project_name = local.project_name
  main_s3_kms_key = module.kms.s3_kms_key.id

}
