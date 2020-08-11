
terraform {
  required_version = "~> 0.13.0"
  required_providers {
    aws = "~> 3.0"
  }
}

provider aws {
  region = local.default_region
}

data aws_caller_identity current {}

data aws_region current {}