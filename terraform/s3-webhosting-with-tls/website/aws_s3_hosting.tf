resource "aws_s3_bucket" "hosting_bucket" {
  bucket        = "k-masatany.com"
  acl           = "private"
  force_destroy = "${var.force_destroy}"

  versioning {
    enabled = true
  }

  website {
    index_document = "${var.index_document}"
    error_document = "${var.error_document}"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["https://${var.domain_name}"]
    expose_headers  = ["ETag"]
    max_age_seconds = "${var.cache_ttl}"
  }

  lifecycle_rule {
    id      = "s3-cloudfront-${lower(var.domain_name)}-content"
    enabled = true

    noncurrent_version_expiration {
      days = 7
    }
  }

  logging {
    target_bucket = "${aws_s3_bucket.logging_bucket.id}"
    target_prefix = "${var.domain_name}/s3"
  }

  tags = "${merge(var.tags, map("Name", format("s3-cloudfront-%s-contents-bucket", var.domain_name)))}"
}

resource "aws_s3_bucket_policy" "hosting_bucket" {
  bucket = "${aws_s3_bucket.hosting_bucket.id}"
  policy = "${data.aws_iam_policy_document.hosting_bucket.json}"
}

data "aws_iam_policy_document" "hosting_bucket" {
  statement {
    sid    = "AllowCloudFrontObjectRead"
    effect = "Allow"

    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.hosting_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.cloudfront.iam_arn}"]
    }
  }

  statement {
    sid    = "AllowCloudFrontBucketList"
    effect = "Allow"

    actions   = ["s3:ListBucket"]
    resources = ["${aws_s3_bucket.hosting_bucket.arn}"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.cloudfront.iam_arn}"]
    }
  }
}
