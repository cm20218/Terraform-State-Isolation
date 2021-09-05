provider "aws" {
  region = "eu-west-2" 
}

## Isolation Via Terraform Workspaces
resource "aws_instance" "workspace_instance" {
    ami           = "ami-0d26eb3972b7f8c96"
    instance_type = "t2.micro"
}

terraform {
    backend  "s3" {
        bucket         = "terraform-statecmbossben"
        key            = "workspaces_example/terraform.tfstate"
        region         = "eu-west-2"
        dynamodb_table = "tbl_terraform_state_locks"
        encrypt        = true
    }
}