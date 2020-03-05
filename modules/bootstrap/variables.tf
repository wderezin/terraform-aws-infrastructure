
variable default_region {
  type        = string
  description = "Your default region where global resources are created."
}

variable tags {
  type        = map(string)
  description = "A map of AWS tags to add to all resources supporting tags."
  default     = {}
}

variable force_destroy {
  type        = bool
  description = "Used to delete all setup resources.  WARNING, this will remove all tfstate files stored in the default region."
  default     = false
}