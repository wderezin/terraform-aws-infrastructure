
provider aws {
  region = local.current_region
}

data aws_caller_identity current {}

data aws_region current {}

