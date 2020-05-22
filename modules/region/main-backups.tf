
module managed_backups {
  source  = "daringway/managed-backups/aws"
  version = "0.0.1"
  tags = local.tags
  create_global_resources = local.create_global_resources
}