
locals {
  tags = merge({
    managed_by  = "terraform",
    environment = var.environment
    },
    var.tags
  )

  is_primary     = terraform.workspace == "default"
  current_region = local.is_primary ? var.default_region : terraform.workspace

  is_primary_count   = local.is_primary ? 1 : 0
  is_secondary_count = local.is_primary ? 0 : 1

  force_destroy = var.force_destroy

  cloudwatch_role_name      = "CloudtrailToCloudwatchWriter"
  cloudwatch_log_name       = "/aws/cloudtrail"
  cloudwatch_retention_days = var.cloudtrail_cloudtrail_retention_days

  role_path = "/service-role/"

  instance_profile_name = "default-ec2"
  is_instance_profile_count = local.is_primary && var.create_default_instance_profile ? 1 : 0

  account_dns_zone_name = var.account_dns_zone_name
}