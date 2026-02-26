terraform {
  backend "s3" {
    bucket         = "ravinder-terraform-demo-bucket-12345"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}