terraform {
  backend "s3" {
    bucket = "terraform-state-rahul"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}
