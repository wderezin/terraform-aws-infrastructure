
resource aws_s3_bucket state {
  count = local.is_secondary_count

  bucket        = "tfstate-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
  force_destroy = local.force_destroy
  region        = terraform.workspace

  versioning {
    enabled = true
  }

  tags = local.tags
}

resource aws_s3_bucket_public_access_block state {
  count = local.is_secondary_count

  bucket = aws_s3_bucket.state[0].id

  restrict_public_buckets = true
  ignore_public_acls      = true
  block_public_acls       = true
  block_public_policy     = true
}

resource aws_s3_bucket config {
  bucket        = "configs-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
  force_destroy = true
  region        = data.aws_region.current.name

  versioning {
    enabled = true
  }

  tags = local.tags
}

resource aws_s3_bucket_public_access_block config {
  bucket = aws_s3_bucket.config.id

  restrict_public_buckets = true
  ignore_public_acls      = true
  block_public_acls       = true
  block_public_policy     = true
}