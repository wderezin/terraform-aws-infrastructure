
module log_bucket {
  source = "./modules/log-bucket"
  tags   = local.tags
}

module cloudtrail {
  source = "./modules/cloudtrail"

  cloudtrail_cloudtrail_retention_days = local.cloudtrail_cloudtrail_retention_days
  log_bucket_name                      = module.log_bucket.bucket_name
  tags                                 = local.tags
}