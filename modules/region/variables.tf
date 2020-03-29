
variable account_info {
  description = "This is output from the root module"
  type = object({
    force_destroy                 = bool,
    manage_default_security_group = bool,
    tags                          = map(any)
  })
}
