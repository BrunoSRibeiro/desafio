resource "aws_route_table" "pb_rt_tb_vpcd" {
  provider = aws.remote
  vpc_id = aws_vpc.vpcd.id
  tags = {
    Name = "${var.vpcd_cidr["name"]}_pb_rt_tb"
  }
  depends_on = [aws_vpc.vpcd]
}

resource "aws_route_table_association" "pb_subnet_ass_vpcd" {
  provider = aws.remote
  count          = length(aws_subnet.subnet-pb_vpcd)
  subnet_id      = aws_subnet.subnet-pb_vpcd[count.index].id
  route_table_id = aws_route_table.pb_rt_tb_vpcd.id
}

resource "aws_route_table" "pv_rt_tb_vpcd" {
  provider = aws.remote
  vpc_id = aws_vpc.vpcd.id
  tags = {
    Name = "${var.vpcd_cidr["name"]}_pv_rt_tb"
  }
  depends_on = [aws_vpc.vpcd]
}

resource "aws_route_table_association" "pv_subnet_ass_vpcd" {
  provider = aws.remote
  count          = length(aws_subnet.subnet-pv_vpcd)
  subnet_id      = aws_subnet.subnet-pv_vpcd[count.index].id
  route_table_id = aws_route_table.pv_rt_tb_vpcd.id
}

resource "aws_route_table_association" "db_subnet_ass_vpcd" {
  provider = aws.remote
  count          = length(aws_subnet.subnet-db_vpcd)
  subnet_id      = aws_subnet.subnet-db_vpcd[count.index].id
  route_table_id = aws_route_table.pv_rt_tb_vpcd.id
}
