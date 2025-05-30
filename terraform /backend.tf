terraform {
  backend "s3" {
    bucket = "shaimaasalem-terraform-state-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true 
  }
} 