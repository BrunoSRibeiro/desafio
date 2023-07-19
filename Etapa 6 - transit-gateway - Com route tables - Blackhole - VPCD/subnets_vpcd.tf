### Criacao subnet VPC-C

resource "aws_subnet" "subnet-pb_vpcd" {
  count = length(var.azs_vpcd)
  provider = aws.remote
  cidr_block = "${cidrsubnet(var.vpcd_cidr.cidr,8,count.index+10)}"
  vpc_id = aws_vpc.vpcd.id
  availability_zone = element(var.azs_vpcd, count.index)
  tags = {
    Name = "${var.vpcd_cidr["name"]}-subnet-pb_az-${element(var.azs_vpcd, count.index)}"
  }
}

resource "aws_subnet" "subnet-pv_vpcd" {
  count = length(var.azs_vpcd)
  provider = aws.remote
  cidr_block = "${cidrsubnet(var.vpcd_cidr.cidr,8,count.index+20)}"
  vpc_id = aws_vpc.vpcd.id
  availability_zone = element(var.azs_vpcd, count.index)
  tags = {
    Name = "${var.vpcd_cidr["name"]}-subnet-pv_az-${element(var.azs_vpcd, count.index)}"
  }
}

resource "aws_subnet" "subnet-db_vpcd" {
  count = length(var.azs_vpcd)
  provider = aws.remote
  cidr_block = "${cidrsubnet(var.vpcd_cidr.cidr,8,count.index+30)}"
  vpc_id = aws_vpc.vpcd.id
  availability_zone = element(var.azs_vpcd, count.index)
  tags = {
    Name = "${var.vpcd_cidr["name"]}-subnet-db_az-${element(var.azs_vpcd, count.index)}"
  }
}

