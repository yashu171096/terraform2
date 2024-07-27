data "aws_ami" "info" {
    most_recent      = true
    owners           = [var.aws_account[data.aws_region.current.name]] 

    filter {
      name   = "name"
      values = ["amzn2-ami-kernel-*-x86_64-gp2"]
    }

    filter {
      name   = "root-device-type"
      values = ["ebs"]
    }

    filter {
      name   = "virtualization-type"
      values = ["hvm"]
    }
}

data "aws_region" "current" {}

data "aws_vpc" "existing_vpc" {
  id = "vpc-0821eb5a2df3b9c86"
}