terraform {
  backend "s3" {
    bucket         = "poc-codedeploy"
    key            = "codedeploy-poc/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "poc-codedeploy-terraform-locks"
    encrypt        = true
  }
}