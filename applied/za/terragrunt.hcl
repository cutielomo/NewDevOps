remote_state {
  backend ="s3" 
  generate = {
    path = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "${get_aws_account_id()}-terraform-state-file"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "cloudtits-terraform-lock"
  }
}



