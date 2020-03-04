
resource aws_s3_bucket state {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}-${local.default_region}"
  force_destroy = local.force_destroy
  region = local.default_region

  versioning {
    enabled = true
  }

  tags = local.tags
}

resource aws_s3_bucket_public_access_block state {
  bucket = aws_s3_bucket.state.id

  restrict_public_buckets = true
  ignore_public_acls = true
  block_public_acls   = true
  block_public_policy = true
}

resource aws_dynamodb_table lock  {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = local.tags
}