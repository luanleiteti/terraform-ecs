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