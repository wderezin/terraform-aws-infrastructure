provider aws {
  region = "us-east-1"
}

module global {
  source = "daringway/infrastructure/aws"
  tags = {
    TAG_NAME = "TAG_VALUE"
  }
}

provider aws {
  alias  = "us-east-1"
  region = "us-east-1"
}
module us-east-1 {
  source = "daringway/infrastructure/aws//modules/region"

  globals = module.global
  providers = {
    aws = aws.us-east-1
  }
}

provider aws {
  alias  = "us-west-1"
  region = "us-west-1"
}
module us-west-1 {
  source = "daringway/infrastructure/aws//modules/region"

  globals = module.global
  providers = {
    aws = aws.us-west-1
  }
}