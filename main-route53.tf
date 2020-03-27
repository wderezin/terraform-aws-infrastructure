
resource "aws_route53_zone" "default" {
  count = local.create_dns_zone_count

  name = local.account_dns_zone_name

  tags = local.tags
}