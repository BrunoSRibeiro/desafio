resource "aws_route_table" "pb_rt_tb_vpcb" {
    vpc_id = aws_vpc.vpcb.id
    tags = {
      Name = "${var.vpcb_cidr["name"]}_pb_rt_tb"
    }
    depends_on = [aws_vpc.vpcb]
}

resource "aws_route_table_association" "pb_subnet_ass_vpcb" {
  count          = length(aws_subnet.subnet-pb_vpcb)
  subnet_id      = aws_subnet.subnet-pb_vpcb[count.index].id
  route_table_id = aws_route_table.pb_rt_tb_vpcb.id
}

resource "aws_route_table" "pv_rt_tb_vpcb" {
    vpc_id = aws_vpc.vpcb.id
    tags = {
      Name = "${var.vpcb_cidr["name"]}_pv_rt_tb"
    }
    depends_on = [aws_vpc.vpcb]
}

resource "aws_route_table_association" "pv_subnet_ass_vpcb" {
  count          = length(aws_subnet.subnet-pv_vpcb)
  subnet_id      = aws_subnet.subnet-pv_vpcb[count.index].id
  route_table_id = aws_route_table.pv_rt_tb_vpcb.id
}

resource "aws_route_table_association" "db_subnet_ass_vpcb" {
  count          = length(aws_subnet.subnet-db_vpcb)
  subnet_id      = aws_subnet.subnet-db_vpcb[count.index].id
  route_table_id = aws_route_table.pv_rt_tb_vpcb.id
}
