variable tags {
  type        = map(string)
  description = "List of AWS tags"
}

variable force_destroy {
  type        = bool
  description = "Used to delete all setup resources.  WARNING, this will remove logs, configs, and tfstate files."
}