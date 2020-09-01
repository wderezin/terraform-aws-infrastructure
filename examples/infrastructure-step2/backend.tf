
terraform {
  backend s3 {
    region         = "DEFAULT_REGION"
    bucket         = "tfstate-ACCOUNT_NUMBER"
    key            = "GITREPO/PATH.tfstate"
    dynamodb_table = "terraform-lock"
  }
}

