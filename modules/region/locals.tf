locals {
  current_region              = data.aws_region.current.name
  tags = var.account_info.tags
  force_destroy = var.account_info.force_destroy
  manage_default_security_group = var.account_info.manage_default_security_group

  create_global_resources = local.current_region == var.account_info.default_region
 }
