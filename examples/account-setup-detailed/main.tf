
module global {
  source = "daringway/account-setup/aws"

  enable_log_bucket         = true
  enable_ec2                = true
  enable_cloudtrail         = true
  cloudtrail_retention_days = 30

  //  Region configurations
  manage_default_security_group = true
  enable_managed_backups        = true

  tags = {
    TAG_NAME = "TAG_VALUE"
  }
}

provider aws {
  alias  = "us-east-1"
  region = "us-east-1"
}
module us-east-1 {
  source = "daringway/account-setup/aws//modules/region"

  globals = module.global
  providers = {
    aws = aws.us-east-1
  }
}
