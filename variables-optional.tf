
variable cloudtrail_cloudtrail_retention_days {
  type        = number
  default     = 90
  description = "Number of days to retain cloudtrail logs in Cloudwatch"
}

variable force_destroy {
  type        = bool
  description = "Used to delete all setup resources.  WARNING, this will remove logs, configs, and tfstate files."
  default     = false
}
