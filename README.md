# Terraform AWS Account Setup Module
A [Daring Way](https://www/daringway.com/) opinionated approach to how to setup an AWS account.

    Contestant: I'll take AWS for $1000 Alex.
    Alex: How do you easily setup AWS account with some best practices?
    Contestant: What is the Daring Way AWS Account Setup Terraform Module

# Quickstart Guide

## Directory layout
A suggested directory layout.

```
/terraform/aws/ENVIRONMENT/account-bootstrap
/terraform/aws/ENVIRONMENT/account-setup
```

where ENVIRONMENT is something like:  dev, qa, nonprod, prod

1) Bootstrap (optional)

    You will need to bootstrap your initial S3 and DynamoDB resources for storing/locking the terraform state files.
    
    NOTE: It is recommended that your bootstrap tfstate files are stored in git. The rest of of your tfstate files will 
    be be stored in the S3 bucket being created.
    
    Decided on your primary region.  If you are unsure then pick `us-east-1`.
    
   Example tf files from [./examples/account-bootstrap](./examples/account-bootstrap)
   ```hcl-terraform
    module bootstrap {
      source         = "daringway/account-setup/aws//modules/backend"
      default_region = "us-east-1"
      tags = {
        TAG_NAME = "TAG_VALUE"
      }
    }
    ```
    
    Once you have setup your tf file.
    
    ```shell script
    $ terraform init
    $ terraform apply
    $ git add terraform.tfstate
    ```

2) Account setup
    In a setup directory configure your tf file like so.
    
   Example tf file from [./examples/account-setup](./examples/account-setup)
   ```hcl-terraform
   terraform {
     backend s3 {
       region         = "DEFAULT_REGION"
       bucket         = "tfstate-ACCOUNT_NUMBER"
       key            = "GITREPO/PATH.tfstate"
       dynamodb_table = "terraform-lock"
     }
   }
   module global {
     source                = "daringway/account-setup/aws"
     tags = {
       TAG_NAME = "TAG_VALUE"
     }
   }
    
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
    
    Once you have setup your tf files to configure you global and regions.
    
    ```shell script
    $ terraform init
    $ terraform apply
    ```

[Semantic Version](https://semver.org) is being applied to the modules. 

1. MAJOR version requires a change. 
    - upgrading to new version of terraform
    - variable name changes
    - new variable without a default value
    - changes that will require manually updating the terraform.tfstate file such as a `terraform state mv`
    - changes that will require resources being destroy and created that require external terraform application configuration
2. MINOR version add new functionality in a backwards compatible manner
    - new variable with default value
3. PATCH version have backwards compatible bug fixes