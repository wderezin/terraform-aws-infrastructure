
module bootstrap {
  source = "daringway/account-setup/aws//modules/bootstrap"
  default_region = "us-east-1"
  force_destroy = true
}