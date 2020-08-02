# Terraform AWS Account Setup Module
A [Daring Way](https://www/daringway.com/) opinionated approach to how to setup an AWS account setup.

# Quickstart Guide

## Directory layout
A suggested directory layout.

```
/terraform/aws/ENVIRONMENT/account-bootstrap
/terraform/aws/ENVIRONMENT/account-setup
```

where ENVIRONMENT is something like:  dev, qa, nonprod, prod


1) Bootstrap

    You will need to bootstrap your initial S3 and DynamoDB resources for storing/locking the terraform state files.
    
    NOTE: It is recommended that your bootstrap tfstate files are stored in git. The rest of of your tfstate files will 
    be be stored in the S3 bucket being created.
    
    Decided on your primary region.  If you are unsure then pick `us-east-1`
    
   See ./examples/account-bootstrap
    
    ```hcl-terraform
    $ terraform init
    $ terraform apply
    $ git add terraform.tfstate
    ```

2) Account setup
    In a setup directory configure your tf file like so.
    
   See ./examples/account-setup
    
    ```hcl-terraform
    $ terraform init
    $ terraform apply
    ```
