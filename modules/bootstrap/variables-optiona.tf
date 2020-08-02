variable force_destroy {
  type        = bool
  description = "Used to delete all setup resources.  WARNING, this will remove all tfstate files stored in the default region."
  default     = false
}