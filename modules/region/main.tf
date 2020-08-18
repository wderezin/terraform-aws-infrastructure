

module managed_backups {
  count  = local.globals.managed_backups_ecount
  source = "../region-default-security-group"

  tags = local.globals.tags
}

module default-security-group {
  count  = local.globals.manage_default_security_group_ecount
  source = "../region-default-security-group"

  tags = local.globals.tags
}