// These resources are only created in the primary region

resource "aws_s3_bucket" "logs" {
  count = local.is_primary_count

  bucket = "logs-${data.aws_caller_identity.current.account_id}"

  force_destroy = local.force_destroy

  versioning {
    enabled = true
  }
}

resource aws_s3_bucket_public_access_block logs {
  count = local.is_primary_count

  bucket = aws_s3_bucket.logs[0].id

  restrict_public_buckets = true
  ignore_public_acls      = true
  block_public_acls       = true
  block_public_policy     = true

}

resource aws_s3_bucket_policy log_policy_attachment {
  count      = local.is_primary_count
  depends_on = [aws_s3_bucket_public_access_block.logs]

  bucket = aws_s3_bucket.logs[0].id
  policy = local.force_destroy ? data.aws_iam_policy_document.log_policy[0].json : data.aws_iam_policy_document.log_nodelete_policy[0].json
}

data aws_iam_policy_document log_nodelete_policy {
  count = local.is_primary_count

  version = "2012-10-17"
  statement {
    sid    = "DenyDelete"
    effect = "Deny"
    actions = [
      "s3:DeleteObject"
    ]
    principals {
      identifiers = ["*"]
      type        = "*"
    }
    resources = [
      "${aws_s3_bucket.logs[0].arn}/*"
    ]
  }

  statement {
    sid    = "AWSCloudTrailAclCheck"
    effect = "Allow"
    actions = [
      "s3:GetBucketAcl"
    ]
    resources = [
      aws_s3_bucket.logs[0].arn
    ]
    principals {
      identifiers = ["cloudtrail.amazonaws.com"]
      type        = "Service"
    }
  }

  statement {
    sid    = "AWSCloudTrailWrite"
    effect = "Allow"
    actions = [
      "s3:PutObject"
    ]
    resources = [
      "${aws_s3_bucket.logs[0].arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
    ]
    principals {
      identifiers = ["cloudtrail.amazonaws.com"]
      type        = "Service"
    }
    condition {
      test     = "StringEquals"
      values   = ["bucket-owner-full-control"]
      variable = "s3:x-amz-acl"
    }
  }
}

data aws_iam_policy_document log_policy {
  count = local.is_primary_count

  version = "2012-10-17"
  statement {
    sid    = "AWSCloudTrailAclCheck"
    effect = "Allow"
    actions = [
      "s3:GetBucketAcl"
    ]
    resources = [
      aws_s3_bucket.logs[0].arn
    ]
    principals {
      identifiers = ["cloudtrail.amazonaws.com"]
      type        = "Service"
    }
  }

  statement {
    sid    = "AWSCloudTrailWrite"
    effect = "Allow"
    actions = [
      "s3:PutObject"
    ]
    resources = [
      "${aws_s3_bucket.logs[0].arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
    ]
    principals {
      identifiers = ["cloudtrail.amazonaws.com"]
      type        = "Service"
    }
    condition {
      test     = "StringEquals"
      values   = ["bucket-owner-full-control"]
      variable = "s3:x-amz-acl"
    }
  }
}