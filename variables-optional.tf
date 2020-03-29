
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

variable manage_default_security_group {
  type        = bool
  default     = true
  description = "Managed the default security group in the default VPC"
}

variable create_default_instance_profile {
  type        = bool
  default     = true
  description = "Create an Instance Profile for basic functionality"
}

