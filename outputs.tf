
output log_bucket {
  value = module.log_bucket
}

output cloudtrail {
  value = module.cloudtrail
}

output tags {
  value = local.tags
}

output managed_backups_ecount {
  value = local.managed_backups_ecount
}

output force_destroy {
  value = local.force_destroy
}

output manage_default_security_group_ecount {
  value = local.default_security_group_ecount
}
