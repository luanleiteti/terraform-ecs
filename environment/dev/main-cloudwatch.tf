module "cloudwatch" {
  source       = "../../modules/cloudwatch"
  stage        = local.stage
  project_name = local.project_name

}