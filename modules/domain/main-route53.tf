
resource aws_route53_zone default {
  name = local.fqdn
//  tags = local.tags
}