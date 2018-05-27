# default region
provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "example.com-terraform-backend"
    key    = "example.com.backend-terraform.tfstate"
    region = "ap-northeast-1"
  }
}

module "website" {
  source = "./website"

  domain_name        = "example.com"
  certificate_domain = "*.example.com"
  alternative_name   = ["example.com"]
  validation_method  = "DNS"
  price_class        = "PriceClass_200"
}
