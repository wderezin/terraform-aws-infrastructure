# Terraform AWS Setup - Region Module

Used to configure each region. Regions are configured through the global (root module). 

```hcl-terraform
provider aws {
 alias  = "us-east-1"
 region = "us-east-1"
}
module us-east-1 {
 source       = "daringway/account-setup/aws//modules/region"

 globals = module.global
 providers = {
   aws = aws.us-east-1
 }
}
```