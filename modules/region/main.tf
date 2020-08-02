
module managed_backups {
  source                  = "../region-managed-backups"
  tags                    = local.tags
  create_global_resources = local.create_global_resources
}

module manage_default_security_group {
  source = "../region-default-security-group"
  tags = local.tags
}