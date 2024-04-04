module "s3" {

  source = "../../modules/s3"

  stage        = local.stage
  project_name = local.project_name

}