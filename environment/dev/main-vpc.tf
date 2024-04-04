module "networking" {
  source       = "../../modules/networking"
  stage        = local.stage
  region       = local.region
  project_name = local.project_name
}
