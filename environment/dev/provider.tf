provider "aws" {
  region  = local.region
  profile = "luanleite.aws"

  default_tags {
    tags = {
      "Projec_name" = local.project_name
      "Stage"       = local.stage
    }
  }
}

terraform {
  backend "s3" {
    bucket  = "project-ecs-terraform-s3"
    key     = "terraform.ecs.tfstate"
    region  = "us-east-1"
    profile = "luanleite.aws"
  }
}