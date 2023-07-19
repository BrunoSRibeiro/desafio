resource "aws_vpc" "vpca" {
  cidr_block = var.vpca_cidr.cidr
  tags = {
    Name = var.vpca_cidr["name"]
  }
}

resource "aws_vpc" "vpcb" {
  cidr_block = var.vpcb_cidr.cidr
  tags = {
    Name = var.vpcb_cidr["name"]
  }
}

resource "aws_vpc" "vpcc" {
  cidr_block = var.vpcc_cidr.cidr
  tags = {
    Name = var.vpcc_cidr["name"]
  }
}


