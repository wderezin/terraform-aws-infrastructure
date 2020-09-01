data aws_caller_identity current {}

locals {
  bucket_name = "tfstate-${data.aws_caller_identity.current.account_id}"


  tags = merge({
    managed_by = "terraform"
    },
    var.tags
  )

  force_destroy = var.force_destroy
}