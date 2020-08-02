
variable account_info {
  description = "This is output from the root module"
  type = object({
    tags                          = map(string),
    force_destroy                 = bool,
    manage_default_security_group = bool,
    default_region                = string
  })
}

variable region_name {
  type = string
  description = "Region name to set the provider to"
}
