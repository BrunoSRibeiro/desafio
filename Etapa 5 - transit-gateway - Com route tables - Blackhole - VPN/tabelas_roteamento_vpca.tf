resource "aws_route_table" "pb_rt_tb_vpca" {
    vpc_id = aws_vpc.vpca.id
    tags = {
      Name = "${var.vpca_cidr["name"]}_pb_rt_tb"
    }
    depends_on = [aws_vpc.vpca]
}

resource "aws_route_table_association" "pb_subnet_ass_vpca" {
  count          = length(aws_subnet.subnet-pb_vpca)
  subnet_id      = aws_subnet.subnet-pb_vpca[count.index].id
  route_table_id = aws_route_table.pb_rt_tb_vpca.id
}

resource "aws_route_table" "pv_rt_tb_vpca" {
    vpc_id = aws_vpc.vpca.id
    tags = {
      Name = "${var.vpca_cidr["name"]}_pv_rt_tb"
    }
    depends_on = [aws_vpc.vpca]
}

resource "aws_route_table_association" "pv_subnet_ass_vpca" {
  count          = length(aws_subnet.subnet-pv_vpca)
  subnet_id      = aws_subnet.subnet-pv_vpca[count.index].id
  route_table_id = aws_route_table.pv_rt_tb_vpca.id
}

resource "aws_route_table_association" "db_subnet_ass_vpca" {
  count          = length(aws_subnet.subnet-db_vpca)
  subnet_id      = aws_subnet.subnet-db_vpca[count.index].id
  route_table_id = aws_route_table.pv_rt_tb_vpca.id
}
