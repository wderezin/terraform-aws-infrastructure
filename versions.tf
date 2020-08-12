
provider aws {
  region = local.default_region
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 0.13"
}
