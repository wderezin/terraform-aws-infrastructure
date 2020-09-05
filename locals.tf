data aws_caller_identity current {}

data aws_region current {}

locals {
  tags = merge({
    managed_by = "terraform",
    },
    var.tags
  )

  //  ecount variables make it easy to specify count for resources/modules
  ec2_ecount                    = var.ec2_enabled ? 1 : 0
  log_bucket_ecount             = var.log_bucket_enabled ? 1 : 0
  cloudtrail_ecount             = var.cloudtrail_enabled && var.log_bucket_enabled ? 1 : 0
  managed_backups_ecount        = var.managed_backups_enabled ? 1 : 0
  default_security_group_ecount = var.default_security_group_managed ? 1 : 0

  force_destroy = var.force_destroy

  cloudtrail_retention_days = var.cloudtrail_retention_days

  role_path = "/service-role/"
}