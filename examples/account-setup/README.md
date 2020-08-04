This allows setting up all your regions with one configuration file
using terraform workspaces.

1) On you have your backend.tf and main.tf setup, 
   setup your primary region with the default workspace.
    
    ```hcl-terraform
    $ terraform apply
    ```