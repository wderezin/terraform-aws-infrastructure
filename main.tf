
module log_bucket {
  count         = local.log_bucket_ecount
  source        = "./modules/log-bucket"
  force_destroy = local.force_destroy
  tags          = local.tags
}

module cloudtrail {
  count  = local.cloudtrail_ecount
  source = "./modules/cloudtrail"

  cloudtrail_cloudtrail_retention_days = local.cloudtrail_retention_days
  log_bucket_name                      = module.log_bucket[0].bucket.bucket
  role_path                            = local.role_path
  tags                                 = local.tags
}

module ec2 {
  count  = local.ec2_ecount
  source = "./modules/ec2"

  tags = local.tags
}
