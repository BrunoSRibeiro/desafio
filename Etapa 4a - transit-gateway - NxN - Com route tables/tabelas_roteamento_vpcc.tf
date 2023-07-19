resource "aws_route_table" "pb_rt_tb_vpcc" {
    vpc_id = aws_vpc.vpcc.id
    tags = {
      Name = "${var.vpcc_cidr["name"]}_pb_rt_tb"
    }
    depends_on = [aws_vpc.vpcc]
}

resource "aws_route_table_association" "pb_subnet_ass_vpcc" {
  count          = length(aws_subnet.subnet-pb_vpcc)
  subnet_id      = aws_subnet.subnet-pb_vpcc[count.index].id
  route_table_id = aws_route_table.pb_rt_tb_vpcc.id
}

resource "aws_route_table" "pv_rt_tb_vpcc" {
    vpc_id = aws_vpc.vpcc.id
    tags = {
      Name = "${var.vpcc_cidr["name"]}_pv_rt_tb"
    }
    depends_on = [aws_vpc.vpcc]
}

resource "aws_route_table_association" "pv_subnet_ass_vpcc" {
  count          = length(aws_subnet.subnet-pv_vpcc)
  subnet_id      = aws_subnet.subnet-pv_vpcc[count.index].id
  route_table_id = aws_route_table.pv_rt_tb_vpcc.id
}

resource "aws_route_table_association" "db_subnet_ass_vpcc" {
  count          = length(aws_subnet.subnet-db_vpcc)
  subnet_id      = aws_subnet.subnet-db_vpcc[count.index].id
  route_table_id = aws_route_table.pv_rt_tb_vpcc.id
}
