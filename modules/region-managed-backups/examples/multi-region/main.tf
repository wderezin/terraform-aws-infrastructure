
provider aws {
  alias  = "us-east-1"
  region = "us-east-1"
}

module backups-us-east-1 {
  source = "daringway/account-setup/aws/modules/managed-backups"
  providers = {
    aws = aws.us-east-1
  }
  tags                    = {}
  create_global_resources = true
}

provider aws {
  alias  = "us-east-2"
  region = "us-east-2"
}

module backups-us-east-2 {
  source = "daringway/account-setup/aws/modules/managed-backups"
  providers = {
    aws = aws.us-east-2
  }
  tags                    = {}
  create_global_resources = false
}