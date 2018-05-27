resource "aws_cloudfront_distribution" "cloudfront" {
  enabled         = true
  is_ipv6_enabled = true
  http_version    = "http2"

  aliases = ["${compact(concat(list(var.domain_name),var.aliases))}"]

  viewer_certificate {
    acm_certificate_arn      = "${aws_acm_certificate.certificate.arn}"
    minimum_protocol_version = "TLSv1"
    ssl_support_method       = "sni-only"
  }

  origin {
    domain_name = "${aws_s3_bucket.hosting_bucket.website_endpoint}"
    origin_id   = "${var.domain_name}"

    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = 60
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  default_root_object = "${var.index_document}"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${aws_s3_bucket.hosting_bucket.id}"

    compress               = true
    viewer_protocol_policy = "redirect-to-https"

    default_ttl = "${var.cache_ttl}"
    min_ttl     = "${(var.cache_ttl / 4) < 60 ? 0 : floor(var.cache_ttl / 4)}"
    max_ttl     = "${floor(var.cache_ttl * 24)}"

    forwarded_values {
      query_string = false

      headers = ["Origin"]

      cookies {
        forward = "none"
      }
    }
  }

  price_class = "${var.price_class}"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  logging_config {
    include_cookies = false
    bucket          = "${aws_s3_bucket.logging_bucket.bucket_domain_name}"
    prefix          = "${var.domain_name}/cloudfront"
  }

  tags = "${merge(var.tags, map("Name", format("s3-cloudfront-%s-distribution", var.domain_name)))}"

  depends_on = [
    "aws_acm_certificate.certificate",
  ]
}

resource "aws_cloudfront_origin_access_identity" "cloudfront" {
  comment = "CloudFront Origin Acess Identity for ${var.domain_name}"
}
