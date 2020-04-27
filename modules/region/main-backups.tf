resource aws_backup_vault managed {
  name        = "managed"
  tags        = local.tags
}
resource "aws_backup_selection" default {
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
  name = "default"
  tags = local.tags

  rule {
    rule_name         = "default"
    target_vault_name = aws_backup_vault.managed.name
    //    schedule          = "cron(0 12 * * ? *)"
  }
}