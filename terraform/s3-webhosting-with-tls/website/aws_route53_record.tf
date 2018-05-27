resource "aws_route53_record" "r53_ns_record" {
  zone_id = "${aws_route53_zone.r53_zone.id}"
  name    = "${var.domain_name}"
  type    = "NS"
  ttl     = "86400"

  lifecycle {
    ignore_changes = [
      "records",
    ]
  }
}

resource "aws_route53_record" "r53_soa_record" {
  zone_id = "${aws_route53_zone.r53_zone.id}"
  name    = "${var.domain_name}"
  type    = "SOA"
  ttl     = "900"

  lifecycle {
    ignore_changes = [
      "records",
    ]
  }
}

resource "aws_route53_record" "certificate_validate" {
  count   = "${length(aws_acm_certificate.certificate.domain_validation_options)}"
  zone_id = "${aws_route53_zone.r53_zone.id}"
  name    = "${lookup(aws_acm_certificate.certificate.domain_validation_options[count.index], "resource_record_name")}"
  type    = "${lookup(aws_acm_certificate.certificate.domain_validation_options[count.index], "resource_record_type")}"
  records = ["${lookup(aws_acm_certificate.certificate.domain_validation_options[count.index], "resource_record_value")}"]
  ttl     = "300"
}

resource "aws_route53_record" "cloudfront" {
  zone_id = "${aws_route53_zone.r53_zone.id}"
  name    = "${var.domain_name}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.cloudfront.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.cloudfront.hosted_zone_id}"
    evaluate_target_health = false
  }
}
