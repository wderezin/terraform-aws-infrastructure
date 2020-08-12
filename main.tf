
module log_bucket {
//  count  = local.enable_log_bucket ? 1 : 0
  source = "./modules/log-bucket"
  tags   = local.tags
}

module cloudtrail {
//  count  = local.enable_cloudtrail && local.enable_log_bucket ? 1 : 0
  source = "./modules/cloudtrail"

  cloudtrail_cloudtrail_retention_days = local.cloudtrail_cloudtrail_retention_days
  log_bucket_name                      = module.log_bucket.bucket_name
  tags                                 = local.tags
}

module ec2 {
//  count  = local.enable_ec2 ? 1 : 0
  source = "./modules/ec2"

  tags = local.tags
}