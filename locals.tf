
locals {
  tags = merge({
    managed_by  = "terraform",
    environment = var.environment
    },
    var.tags
  )

  enable_cloudtrail = var.enable_cloudtrail
  enable_ec2        = var.enable_ec2
  enable_log_bucket = var.enable_log_bucket

  default_region = var.default_region
  force_destroy  = var.force_destroy

  cloudtrail_cloudtrail_retention_days = var.cloudtrail_cloudtrail_retention_days

  role_path = "/service-role/"
}