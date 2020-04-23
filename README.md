# Terraform AWS Account Setup Module
An opinionated AWS account setup with only options to adjust cost impacting setting.

NOTE: This is currently under develop and should not be considered a stable

# Quickstart Guide

1) Bootstrap

    You will need to bootstrap your initial S3 and DynamoDB resources for storing/locking the terraform state files.
    This will be the only tfstate files that are stored locally and not in S3.
    Decided on your primary region.
    
   See ./examples/account-bootstrap
    
    ```hcl-terraform
    $ terraform init
    $ terraform apply
    ```

2)
    In a setup directory configure your tf file like so.
    
   See ./examples/account-setup

3) Finish setting up you primary region
    
    ```hcl-terraform
    $ terraform init
    $ terraform apply
    ```

4) Register the DNS Nameservers.

You now have bootstraped your environment and setup at least 1 regions.  
