resource "aws_instance" "tvpca" {
  ami = "ami-04823729c75214919"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  associate_public_ip_address = true
  tags = {
    Name = "TESTE_VPC-A"
  }
  subnet_id = aws_subnet.subnet-pb_vpca[0].id
  vpc_security_group_ids = ["${aws_security_group.acessos_vpca.id}"]
}

resource "aws_instance" "tvpcb" {
  ami = "ami-04823729c75214919"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "TESTE_VPC-B"
  }
  subnet_id = aws_subnet.subnet-pv_vpcb[1].id
  vpc_security_group_ids = ["${aws_security_group.acessos_vpcb.id}"]
}

resource "aws_instance" "tvpcc" {
  ami = "ami-04823729c75214919"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "TESTE_VPC-C"
  }
  subnet_id = aws_subnet.subnet-db_vpcc[2].id
  vpc_security_group_ids = ["${aws_security_group.acessos_vpcc.id}"]
}

