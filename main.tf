provider "aws" {
  region = "us-east-1"
  profile = "luanleite.aws"

  default_tags {
    tags = {
      "ClusterName" = "project-ecs"
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
  cluster_name = "project-ecs"
}