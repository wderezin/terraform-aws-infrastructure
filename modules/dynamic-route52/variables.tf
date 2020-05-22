
variable tags {
  type = map(string)
  description = "List of AWS tags"
}

variable create_global_resources {
  type = bool
  default = true
  description = "If deploying to multiple regions, only set to true in one region."
}
