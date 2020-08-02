locals {
  region                = var.region
  tags                          = var.account_info.tags
  force_destroy                 = var.account_info.force_destroy
  manage_default_security_group = var.account_info.manage_default_security_group

  create_global_resources = local.region == var.account_info.default_region
}
