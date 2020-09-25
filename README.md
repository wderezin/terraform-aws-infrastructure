# Terraform AWS Infrastructure Module
A [Daring Way](https://www/daringway.com/) opinionated approach to how to setup an AWS account.

    Contestant: I'll take AWS for $1000 Alex.
    Alex: How do you easily setup AWS account with some best practices?
    Contestant: What is the Daring Way AWS Account Setup Terraform Module

# Overview

This is designed to configure an AWS account for use with such things as a 
logging bucket, cloud trails, managed backup policies, etc.  Though each option is 
enabled by default (the opinionated part) each one can be turned off (telling it to be quite part.)

# Quickstart Guide

## Directory layout
A suggested directory layout.

```
/terraform/aws/ENVIRONMENT/infrastructure
```

where ENVIRONMENT is something like:  dev, qa, nonprod, prod

1) Bootstrap the backend (optional)

    You will need to bootstrap your initial S3 and DynamoDB resources for storing/locking the terraform state files.
    
    NOTE: It is recommended that your bootstrap tfstate files are stored in git. The rest of of your tfstate files will 
    be be stored in the S3 bucket being created.
    
    Decided on your primary region.  If you are unsure then pick `us-east-1`.
    
   Example tf files from [./examples/infrastructure-step1](examples/infrastracture-step1)

   ```hcl-terraform
    module bootstrap {
      source         = "daringway/infrastructure/aws//modules/backend"
      default_region = "us-east-1"
      tags = {
        TAG_NAME = "TAG_VALUE"
      }
    }
    ```
   
   Once you have setup your files it is time to deploy.
    
    ```shell script
    $ terraform init
    $ terraform apply
    $ git add terraform.tfstate
    ```
   
   You need to store tfstate file somewhere and one option is to store it git.  This is the only tfstate 
   that will be stored in git and there are not passwords or credentials in the state file.  Also, this is the only time
   you will need to run this phase during normal operations. 
   
       ```shell script
       $ git add terraform.tfstate
       ```

2) Global Settings

    Your global module will handle all configuration settings for your global resources such as IAM accounts and 
    also region specific configurations such as Managed Backups and Security groups.  However, due to the way 
    terraform handles provider blocks in modules you will have a module for your global and a module for each 
    region you want to setup.
    

   Example tf file from [./examples/infrastructure-step2(examples/infrastructure-step2)
   ```hcl-terraform
   module global {
     source                = "daringway/infrastructure-step2/aws"
     tags = {
       TAG_NAME = "TAG_VALUE"
     }
   }
   ```
    

   provider aws {
     alias  = "us-east-1"
     region = "us-east-1"
   }
   module us-east-1 {
     source       = "daringway/infrastructure/aws//modules/region"
    
    This is a complete region configuration.  If you need to make setting changes to a region they are specified in the 
    global module and are passed to the region module with the `globals` variable, see [./examples/account-setup-detailed](./examples/account-setup-detailed).  This is done for two 
    reasons.  First, some region configurtions require global resources like IAM roles.  Second, it provide a single 
    source location for all region configuration when using multiple regions. 
    
    ```hcl-terraform
    provider aws {
      alias  = "us-east-1"
      region = "us-east-1"
    }
    module us-east-1 {
      source = "daringway/account-setup/aws//modules/region"
    
      globals = module.global
      providers = {
        aws = aws.us-east-1
      }
    }
    ```

4) Deployment time

  Once you have setup your tf files for your global and regions, it's deployment time.
  
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
