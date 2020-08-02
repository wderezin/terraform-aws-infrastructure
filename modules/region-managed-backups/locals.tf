
locals {
  tags                = var.tags
  backup_iam_arn      = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/backup"
  create_global_count = var.create_global_resources ? 1 : 0
}