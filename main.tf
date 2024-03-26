provider "aws" {
  region = "us-east-1"
  profile = "luanleite.aws"

  default_tags {
    tags = {
      "Projec_name" = "project-ecs"
      "Stage"       = "dev"
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

module "networking" {
  source       = "./modules/networking"
  stage        = "dev"
  region       = "us-east-1"
  project_name = "project-ecs"
}