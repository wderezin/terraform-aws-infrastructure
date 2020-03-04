# Terraform AWS Account Setup Module
An opinionated AWS account setup with only options to adjust cost impacting setting.

NOTE: This is currently under develop and should not be considered a complete
 setup while the version is 0.0.x 

# Quickstart Guide

1) Bootstrap

    You will need to bootstrap your initial S3 and DynamoDB resources for storing/locking the terraform state files.
    This will be the only tfstate files that are stored locally and not in S3.
    Decided on your primary region.
    
    In a bootstrap directory configure your tf file like
    ```hcl-terraform
    module bootstrap {
      source = "../../../../terraform-aws-account-setup/modules/bootstrap"
      primary_region = "us-east-1"
    }
    ```
    
    ```hcl-terraform
    $ terraform init
    $ terraform apply
    ```

2)
    In a setup directory configure your tf file like so.
    
    ```hcl-terraform
    terraform {
      backend s3 {                
        bucket         = "tfstate-01234567890-us-east-1"
        key            = "repo-name/dev/infrastructure.tfstate"
        region         = "us-east-1"
        dynamodb_table = "terraform-lock"
      }
    }
    
    module account_infrastructure {
      source = "../../../../terraform-aws-account-setup"
      default_region = "us-east-1"
    }
    ```

3) Finish setting up you primary region
    
    ```hcl-terraform
    $ terraform apply
    ```

4) Setup each additional region
    
    ```hcl-terraform
    $ terraform workspace new us-east-2
    $ terraform apply
    ```

You now have bootstraped your environment and setup 2 regions.  
If you need to setup more regions, just repeat step 4.