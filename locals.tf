
locals {
  tags = merge({
    managed_by = "terraform"
  },
  var.tags
  )

  is_primary = terraform.workspace == "default"
  current_region = local.is_primary ? var.default_region : terraform.workspace

  is_primary_count = local.is_primary ? 1 : 0
  is_secondary_count = local.is_primary ? 0 : 1

  force_destroy = var.force_destroy

  cloudwatch_role_name      = "CloudtrailToCloudwatchWriter"
  cloudwatch_log_name       = "/aws/cloudtrail"
  cloudwatch_retention_days = var.cloudtrail_cloudtrail_retention_days

  role_path = "/service-role/"
}