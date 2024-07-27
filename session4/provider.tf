terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.56.1"
    }
  }
  backend "s3" {
    bucket = "timing-remote-state"
    key    = "timings"
    region = "us-east-1"
    dynamodb_table = "timings-lock"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}