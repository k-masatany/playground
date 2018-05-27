resource "aws_route53_zone" "r53_zone" {
  name    = "k-masatany.com"
  comment = ""

  tags = "${merge(var.tags, map("Name", format("route53-hosted-zone-for-%s", var.domain_name)))}"
}
