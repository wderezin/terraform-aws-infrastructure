
module global {
  source         = "daringway/account-setup/aws"
  default_region = "us-east-1"
  providers = {
    aws = aws.us-east-1
  }
  environment = "ENV"
  account_dns_zone_name = "DOMAIN"
}

// You must specify the default region here as well.
module us-east-1 {
  source       = "daringway/account-setup/aws//modules/region"
  providers = {
    aws = aws.us-east-1
  }
  account_info = module.global.account_info
}

module us-east-2 {
  source       = "daringway/account-setup/aws//modules/region"
  providers = {
    aws = aws.us-east-2
  }
  account_info = module.global.account_info
}