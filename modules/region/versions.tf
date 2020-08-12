
provider aws {
  region = local.region_name
}

data aws_caller_identity current {}

data aws_region current {}