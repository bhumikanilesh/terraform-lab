# Day 2 - Variables and Configurations

## Objective
Use variables and tfvars files.

## Steps
- Defined filename and message variables
- Created dev.tfvars and prod.tfvars
- Applied Terraform using variable files

## Commands
terraform init
terraform apply -var-file="dev.tfvars"
terraform apply -var-file="prod.tfvars"

