provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "luan-lambda-terraform-s3"
    key    = "terraform.ecs.tfstate"
    region = "us-west-2"
  }
}

module "networking" {
  source        = "./modules/networking"
  cluster_name  = "luan-ecs"
  stage         = "dev"
  cidr_ip_block = "10.10.0.0/16"
}