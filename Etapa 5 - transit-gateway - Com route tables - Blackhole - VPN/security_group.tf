resource "aws_security_group" "acessos_vpca" {
  name        = "acessos_vpca"
  description = "acessos_vpca"
  vpc_id = aws_vpc.vpca.id

  ingress {
    description      = "acesso_ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "acesso_icmp"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "acessos_vpca"
  }
}

resource "aws_security_group" "acessos_vpcb" {
  name        = "acessos_vpcb"
  description = "acessos_vpcb"
  vpc_id = aws_vpc.vpcb.id

  ingress {
    description      = "acesso_ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "acesso_icmp"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "acessos_vpcb"
  }
}

resource "aws_security_group" "acessos_vpcc" {
  name        = "acessos_vpcc"
  description = "acessos_vpcc"
  vpc_id = aws_vpc.vpcc.id

  ingress {
    description      = "acesso_ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "acesso_icmp"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "acessos_vpcc"
  }
}

