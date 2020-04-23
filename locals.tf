
locals {
  tags = merge({
    managed_by  = "terraform",
    environment = var.environment
    },
    var.tags
  )

  default_region = var.default_region
  force_destroy  = var.force_destroy

  cloudwatch_role_name      = "CloudtrailToCloudwatchWriter"
  cloudwatch_log_name       = "/aws/cloudtrail"
  cloudwatch_retention_days = var.cloudtrail_cloudtrail_retention_days

  role_path = "/service-role/"

  create_instance_profile_count = var.create_default_instance_profile ? 1 : 0
  instance_profile_name         = "default-ec2"

  account_dns_zone_name = var.account_dns_zone_name

  acm_cert_domain = "*.${local.account_dns_zone_name}"
}