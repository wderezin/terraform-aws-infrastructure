data aws_caller_identity current {}

data aws_region current {}

locals {
  tags = merge({
    managed_by = "terraform",
    },
    var.tags
  )

//  ecount variables make it easy to specify count for resources/modules
  ec2_ecount                           = var.enable_ec2 ? 1 : 0
  log_bucket_ecount                    = var.enable_log_bucket ? 1 : 0
  cloudtrail_ecount                    = var.enable_cloudtrail && var.enable_log_bucket ? 1 : 0
  managed_backups_ecount               = var.enable_managed_backups ? 1 : 0
  manage_default_security_group_ecount = var.manage_default_security_group ? 1 : 0

  force_destroy = var.force_destroy

  cloudtrail_retention_days = var.cloudtrail_retention_days

  role_path = "/service-role/"
}