data aws_caller_identity current {}

data aws_region current {}

locals {
  force_destroy = var.force_destroy
  tags          = var.tags
}