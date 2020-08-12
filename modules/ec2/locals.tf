data aws_caller_identity current {}

data aws_region current {}

locals {
  instance_profile_name = "default-ec2"
  tags                  = var.tags
}