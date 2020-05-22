
module managed_backups {
  source  = "../managed-backups"
  tags = local.tags
  create_global_resources = local.create_global_resources
}