### Common
variable "domain_name" {
  type    = "string"
  default = ""
}

variable "tags" {
  type = "map"

  default = {
    Description = "This resource was created through Terraform"
  }
}

# Certificate Manager
variable "certificate_domain" {
  type    = "string"
  default = ""
}

variable "alternative_name" {
  type    = "list"
  default = []
}

variable "validation_method" {
  type    = "string"
  default = "DNS"
}

# CloudFront
variable "aliases" {
  type    = "list"
  default = []
}

variable "cache_ttl" {
  type    = "string"
  default = 3600
}

variable "price_class" {
  // 100: Limit to only Europe, USA, and Canada endpoints.
  // 200: + Hong Kong, Philippines, South Korea, Singapore, & Taiwan.
  // All: + South America, and Australa.  # Hosting S3  # Logiing S3
  type = "string"

  default = "PriceClass_100"
}

# Hosting S3 Bucket
variable "index_document" {
  type    = "string"
  default = "index.html"
}

variable "error_document" {
  type    = "string"
  default = "error.html"
}

variable "force_destroy" {
  type    = "string"
  default = "false"
}

# Logging S3 Bucket
variable "logs_number_of_days_to_ia" {
  type    = "string"
  default = 30
}

variable "logs_number_of_days_to_glacier" {
  type    = "string"
  default = 60
}

variable "logs_number_of_days_to_expiration" {
  type    = "string"
  default = 365
}
