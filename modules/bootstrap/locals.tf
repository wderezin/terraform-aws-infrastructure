
locals {
  default_region = var.default_region

  tags = merge({
    managed_by = "terraform"
  },
  var.tags
  )

  force_destroy = var.force_destroy

}