
module bootstrap {
  source         = "daringway/infrastructure/aws//modules/backend"
  default_region = "us-east-1"
  tags = {
    TAG_NAME = "TAG_VALUE"
  }
}