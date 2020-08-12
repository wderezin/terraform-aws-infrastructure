
variable enable_cloudtrail {
  type        = bool
  default     = true
  description = "Enable cloudtrail configurtion.  enable_log_bucket must also be true."
}

variable cloudtrail_cloudtrail_retention_days {
  type        = number
  default     = 90
  description = "Number of days to retain cloudtrail logs in Cloudwatch."
}

variable enable_ec2 {
  type        = bool
  default     = true
  description = "Enable EC2 setup."
}

variable enable_log_bucket {
  type        = bool
  default     = true
  description = "Enable S3 Log Bucket. Must be enabled for cloudtrails"
}

variable force_destroy {
  type        = bool
  description = "Used to delete all setup resources.  WARNING, this will remove logs, configs, and tfstate files."
  default     = false
}

variable manage_default_security_group {
  type        = bool
  default     = true
  description = "Managed the default security group in the default VPC for a Region.  Passed through to Region Module."
}


