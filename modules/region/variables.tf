
variable account_info {
  description = "This is output from the root module"
  type = object({
    tags                          = map(string),
    backup_iam_arn = string,
    force_destroy                 = bool,
    manage_default_security_group = bool,
    tags                          = map(any)
  })
}
