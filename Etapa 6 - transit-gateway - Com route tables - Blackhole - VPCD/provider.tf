provider "aws" {
  profile = "terraform-aws"
  region  = "us-east-1"
}

provider "aws" {
    alias = "remote"
    profile = "terraform-aws"
    region = "us-east-2"
}
