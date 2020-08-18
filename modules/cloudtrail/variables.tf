variable tags {
  type        = map(string)
  description = "List of AWS tags"
}

variable log_bucket_name {
  type        = string
  description = "Bucket to store cloudtrail logs"
}

variable cloudtrail_cloudtrail_retention_days {
  type        = number
  description = "Number of days to retain cloudtrail logs in Cloudwatch"
}

variable role_path {
  type        = string
  description = "IAM role path"
}