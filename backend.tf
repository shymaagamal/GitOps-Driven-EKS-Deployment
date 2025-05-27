terraform {
  backend "s3" {
    bucket = "aws-terraform-backend-statefile"
    key = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true 
  }
}