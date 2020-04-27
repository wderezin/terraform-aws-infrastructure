locals {
  current_region              = data.aws_region.current.name
  tags = var.account_info.tags
  force_destroy = var.account_info.force_destroy
  manage_default_security_group = var.account_info.manage_default_security_group
  backup_iam_arn = var.account_info.backup_iam_arn
}
