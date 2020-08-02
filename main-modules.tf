
module cloudtrail {
  source = "./modules/cloudtrail"

  cloudtrail_cloudtrail_retention_days = local.cloudtrail_cloudtrail_retention_days
  tags                                 = local.tags
}