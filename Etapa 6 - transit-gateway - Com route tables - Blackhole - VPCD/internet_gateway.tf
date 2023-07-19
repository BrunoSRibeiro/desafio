resource "aws_internet_gateway" "int_gw_vpca" {
  vpc_id = aws_vpc.vpca.id
  tags = {
    Name = "${var.vpca_cidr["name"]}_int_gw"
  }
}

resource "aws_internet_gateway" "int_gw_vpcb" {
  vpc_id = aws_vpc.vpcb.id
  tags = {
    Name = "${var.vpcb_cidr["name"]}_int_gw"
  }
}

resource "aws_internet_gateway" "int_gw_vpcc" {
  vpc_id = aws_vpc.vpcc.id
  tags = {
    Name = "${var.vpcc_cidr["name"]}_int_gw"
  }
}

resource "aws_internet_gateway" "int_gw_vpcd" {
  provider = aws.remote
  vpc_id = aws_vpc.vpcd.id
  tags = {
    Name = "${var.vpcd_cidr["name"]}_int_gw"
  }
}
