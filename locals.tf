
locals {
  tags = merge({
    managed_by  = "terraform",
    environment = var.environment
    },
    var.tags
  )

  default_region = var.default_region
  force_destroy  = var.force_destroy

  cloudtrail_cloudtrail_retention_days = var.cloudtrail_cloudtrail_retention_days

  role_path = "/service-role/"
}