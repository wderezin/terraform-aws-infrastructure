


provider aws {
  region = local.default_region
}

data aws_caller_identity current {}

data aws_region current {}