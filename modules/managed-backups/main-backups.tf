resource aws_backup_vault managed {
  name = "managed"
  tags = local.tags
}
resource "aws_backup_selection" default {
  depends_on   = [aws_iam_role.backup]
  iam_role_arn = local.backup_iam_arn
  name         = "default"
  plan_id      = aws_backup_plan.default.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "backup"
    value = "default"
  }
  selection_tag {
    type  = "STRINGEQUALS"
    key   = "backup"
    value = "true"
  }
}

resource aws_backup_plan default {
  name = "30_day"
  tags = local.tags

  rule {
    rule_name         = "keep_for_30"
    target_vault_name = aws_backup_vault.managed.name
    schedule          = "cron(0 5 ? * * *)"
    lifecycle {
      cold_storage_after = 0
      delete_after       = 30
    }
  }
}