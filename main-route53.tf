
resource aws_route53_zone default {
  name = local.account_dns_zone_name
  tags = local.tags
}