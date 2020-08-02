
module cloudtrail {
  source = "./modules/cloudtrail"

  cloudtrail_cloudtrail_retention_days = local.cloudtrail_cloudtrail_retention_days
  log_bucket_name                      = aws_s3_bucket.logs.id
  tags                                 = local.tags
}