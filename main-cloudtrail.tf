// These resources are only created in the primary region

resource aws_cloudtrail default {
  depends_on = [aws_s3_bucket_policy.log_policy_attachment]

  name                          = "DefaultTrail"
  include_global_service_events = true
  is_multi_region_trail         = true

  s3_bucket_name             = aws_s3_bucket.logs.id
  enable_log_file_validation = true

  cloud_watch_logs_role_arn  = aws_iam_role.cloudtrail_cloudwatch.arn
  cloud_watch_logs_group_arn = aws_cloudwatch_log_group.cloudtrail.arn
}

data aws_iam_policy_document cloudtrail_assume_role {

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
  }
}

resource aws_iam_role cloudtrail_cloudwatch {
  name               = local.cloudwatch_role_name
  path               = local.role_path
  assume_role_policy = data.aws_iam_policy_document.cloudtrail_assume_role.json
  description        = "Allows CloudTrail to send logs to Cloudwatch"

  tags = local.tags
}

resource aws_cloudwatch_log_group cloudtrail {
  name              = local.cloudwatch_log_name
  retention_in_days = local.cloudwatch_retention_days

  tags = local.tags
}

data aws_iam_policy_document cloudtrail_cloudwatch_logs {
  statement {
    sid    = "WriteCloudWatchLogs"
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:${local.cloudwatch_log_name}:*"]
  }
}

// inline policy
resource aws_iam_role_policy cloudtrail_cloudwatch_logs {
  name   = "cloudwatch-write"
  role   = aws_iam_role.cloudtrail_cloudwatch.name
  policy = data.aws_iam_policy_document.cloudtrail_cloudwatch_logs.json
}


