
variable default_region {
  type        = string
  description = "Your default region where global resources are created."
}

variable tags {
  type        = map(string)
  description = "A map of AWS tags to add to all resources supporting tags."
}
