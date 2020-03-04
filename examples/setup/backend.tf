
terraform {
  backend s3 {
    bucket         = "tfstate-01234567890-us-east-1"
    key            = "terraform-aws-account-setup/examples/setup.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

