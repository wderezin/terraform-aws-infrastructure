
variable globals {
  description = "This is output from the root module"
  type = object({
    tags                                 = map(string),
    force_destroy                        = bool,
    manage_default_security_group_ecount = number,
    managed_backups_ecount               = number
  })
}
