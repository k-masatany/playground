resource "aws_s3_bucket" "logging_bucket" {
  bucket        = "s3-cloudfront-${var.domain_name}-logs"
  acl           = "log-delivery-write"
  force_destroy = "${var.force_destroy}"

  lifecycle_rule {
    id      = "s3-cloudfront-${var.domain_name}-logs-transitions"
    enabled = true

    transition {
      days          = "${var.logs_number_of_days_to_ia}"
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = "${var.logs_number_of_days_to_glacier}"
      storage_class = "GLACIER"
    }

    expiration {
      days = "${var.logs_number_of_days_to_expiration}"
    }
  }

  tags = "${merge(var.tags, map("Name", format("s3-cloudfront-%s-logs-bucket", var.domain_name)))}"
}
