provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "k-masatany-terraform-backend"
    key    = "efs-sample.terraform.tfstate"
    region = "ap-northeast-1"
  }
}
