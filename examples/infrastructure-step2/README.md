This allows setting up all your regions with one configuration file
using terraform workspaces.

1) Add these files to the same directory you created `infrastrcuture-step1` one.

2)  When you run init it will ask you if you want to move you state file to
to the new backend.  Answer yes.

    ```hcl-terraform
   $ terraform init
   $ terraform apply
    ```