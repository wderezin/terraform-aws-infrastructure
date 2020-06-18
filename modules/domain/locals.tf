
locals {
  fqdn = var.fqdn
  acm_cert_domain = "*.${local.fqdn}"

}