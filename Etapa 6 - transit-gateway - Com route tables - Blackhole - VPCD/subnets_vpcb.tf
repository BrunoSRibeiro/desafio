### Criacao subnet VPC-B

resource "aws_subnet" "subnet-pb_vpcb" {
  count = length(var.azs)
  cidr_block = "${cidrsubnet(var.vpcb_cidr.cidr,8,count.index+10)}"
  vpc_id = aws_vpc.vpcb.id
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.vpcb_cidr["name"]}-subnet-pb_az-${element(var.azs, count.index)}"
  }
}

resource "aws_subnet" "subnet-pv_vpcb" {
  count = length(var.azs)
  cidr_block = "${cidrsubnet(var.vpcb_cidr.cidr,8,count.index+20)}"
  vpc_id = aws_vpc.vpcb.id
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.vpcb_cidr["name"]}-subnet-pv_az-${element(var.azs, count.index)}"
  }
}

resource "aws_subnet" "subnet-db_vpcb" {
  count = length(var.azs)
  cidr_block = "${cidrsubnet(var.vpcb_cidr.cidr,8,count.index+30)}"
  vpc_id = aws_vpc.vpcb.id
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.vpcb_cidr["name"]}-subnet-db_az-${element(var.azs, count.index)}"
  }
}

