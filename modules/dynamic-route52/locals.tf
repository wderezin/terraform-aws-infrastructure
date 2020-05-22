
locals {
  tags = var.tags
  create_global_count = var.create_global_resources ? 1 : 0
}