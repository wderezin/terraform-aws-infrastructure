
resource aws_backup_vault default {
  name        = "backup_vault"
  tags        = local.tags
}

resource "aws_iam_role" backup {
  name               = "backup"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["sts:AssumeRole"],
      "Effect": "allow",
      "Principal": {
        "Service": ["backup.amazonaws.com"]
      }
    }
  ]
}
POLICY
}

resource aws_iam_role_policy_attachment backup {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.backup.name
}

resource "aws_backup_selection" "example" {
  iam_role_arn = aws_iam_role.backup.arn
  name         = "defualt_backup_selection"
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
  name = "default_backup_plan"

  rule {
    rule_name         = "backup_rule"
    target_vault_name = aws_backup_vault.default.name
//    schedule          = "cron(0 12 * * ? *)"
  }
}