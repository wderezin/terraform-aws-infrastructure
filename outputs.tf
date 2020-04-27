
output zone_id {
  value = aws_route53_zone.default.zone_id
}

output tags {
  value = local.tags
}

// We define this as a local here so it can be used in the submodule secondary-region in main.tf
locals {
  account_info = {
    force_destroy                 = local.force_destroy,
    default_region                = var.default_region,
    manage_default_security_group = var.manage_default_security_group,
    tags                          = local.tags,
    backup_iam_arn = aws_iam_role.backup.arn
  }
}

output account_info {
  value = local.account_info
}

output zone_name_servers {
  value = aws_route53_zone.default.name_servers
}