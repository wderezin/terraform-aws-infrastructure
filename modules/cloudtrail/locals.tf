data aws_caller_identity current {}

data aws_region current {}

locals {
  role_path = "/service-role/"

  cloudwatch_role_name      = "CloudtrailToCloudwatchWriter"
  cloudwatch_log_name       = "/aws/cloudtrail"
  cloudwatch_retention_days = var.cloudtrail_cloudtrail_retention_days
  log_bucket_name           = var.log_bucket_name
  tags                      = var.tags
}