
terraform {
  required_version = "~> 0.12.0"
  required_providers {
    aws = "~> 2.0"
  }
}

provider aws {
  region = local.region
}

data aws_caller_identity current {}

data aws_region current {}