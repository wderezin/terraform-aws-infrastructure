
module account_infrastructure {
  source         = "daringway/account-setup/aws"
  default_region = "us-east-1"
  providers = {
    aws = aws.us-east-1
  }
  environment = "ENV"
  account_dns_zone_name = "DOMAIN"
}

// Multi region
module <REGION> {
  source       = "daringway/account-setup/aws//modules/region"
  providers = {
    aws = aws.REGION
  }
  account_info = account_infrastructure.account_info
}