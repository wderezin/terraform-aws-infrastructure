
resource aws_cloudtrail default {
  count = local.is_primary_count
  depends_on = [aws_s3_bucket_policy.log_policy_attachment[0]]

  name = "DefaultTrail"
  include_global_service_events = true
  is_multi_region_trail         = true

  s3_bucket_name = aws_s3_bucket.logs[0].id
  enable_log_file_validation = true

  cloud_watch_logs_role_arn = aws_iam_role.cloudtrail_cloudwatch[0].arn
  cloud_watch_logs_group_arn = aws_cloudwatch_log_group.cloudtrail[0].arn
}

data aws_iam_policy_document cloudtrail_assume_role {
  count = local.is_primary_count

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
  count = local.is_primary_count

  name               = local.cloudwatch_role_name
  path               = local.role_path
  assume_role_policy = data.aws_iam_policy_document.cloudtrail_assume_role[0].json
  description = "Allows CloudTrail to send logs to Cloudwatch"

  tags = local.tags
}

resource aws_cloudwatch_log_group cloudtrail {
  count = local.is_primary_count

  name              = local.cloudwatch_log_name
  retention_in_days = local.cloudwatch_retention_days

  tags = local.tags
}

data aws_iam_policy_document cloudtrail_cloudwatch_logs {
  count = local.is_primary_count

  statement {
    sid = "WriteCloudWatchLogs"
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
  count = local.is_primary_count

  name   = "cloudwatch-write"
  role   = aws_iam_role.cloudtrail_cloudwatch[0].name
  policy = data.aws_iam_policy_document.cloudtrail_cloudwatch_logs[0].json
}


