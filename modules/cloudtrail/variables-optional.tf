variable cloudtrail_cloudtrail_retention_days {
  type        = number
  default     = 90
  description = "Number of days to retain cloudtrail logs in Cloudwatch"
}

variable role_path {
  type        = string
  default     = "/service-role/"
  description = "IAM role path"
}