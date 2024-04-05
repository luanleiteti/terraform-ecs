module "iam" {
  source       = "../../modules/iam"
  stage        = local.stage
  project_name = local.project_name
}
