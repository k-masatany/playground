provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

resource "aws_acm_certificate" "certificate" {
  provider                  = "aws.us-east-1"
  domain_name               = "${var.certificate_domain}"
  subject_alternative_names = ["${compact(var.alternative_name)}"]
  validation_method         = "${var.validation_method}"
  tags                      = "${merge(var.tags, map("Name", format("certificate-for-%s", var.domain_name)))}"
}
