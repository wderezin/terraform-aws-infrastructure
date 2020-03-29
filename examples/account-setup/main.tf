
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
module us-east-2 {
  source       = "daringway/account-setup/aws//modules/region"
  providers = {
    aws = aws.us-east-2
  }
  account_info = account_infrastructure.account_info
}