This allows setting up all your regions with one configuration file
using terraform workspaces.

1) On you have your backend.tf and main.tf setup, 
   setup your primary region with the default workspace.
    
    ```hcl-terraform
    $ terraform apply
    ```

4) Setup each additional region.

    If you are to also setup the us-east-2 and us-west-1 regions.
    
    ```hcl-terraform
    $ terraform workspace new us-east-2
    $ terraform apply
    $ terraform workspace new us-west-1
    $ terraform apply
    ```