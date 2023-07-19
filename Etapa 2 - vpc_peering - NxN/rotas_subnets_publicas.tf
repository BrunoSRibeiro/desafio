resource "aws_route" "rt_pb_vpca_int_gw" {
    route_table_id = aws_route_table.pb_rt_tb_vpca.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.int_gw_vpca.id
}

resource "aws_route" "rt_pb_vpcb_int_gw" {
    route_table_id = aws_route_table.pb_rt_tb_vpcb.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.int_gw_vpcb.id
}

resource "aws_route" "rt_pb_vpcc_int_gw" {
    route_table_id = aws_route_table.pb_rt_tb_vpcc.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.int_gw_vpcc.id
}

resource "aws_route" "rt_pb_vpca_peer_A-B" {
    route_table_id = aws_route_table.pb_rt_tb_vpca.id
    destination_cidr_block = aws_vpc.vpcb.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_vpca-vpcb.id
    depends_on = [ aws_route_table.pb_rt_tb_vpca ]
}

resource "aws_route" "rt_pb_vpcb_peer_B-A" {
    route_table_id = aws_route_table.pb_rt_tb_vpcb.id
    destination_cidr_block = aws_vpc.vpca.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_vpca-vpcb.id
    depends_on = [ aws_route_table.pb_rt_tb_vpcb ]
}

resource "aws_route" "rt_pb_vpca_peer_A-C" {
    route_table_id = aws_route_table.pb_rt_tb_vpca.id
    destination_cidr_block = aws_vpc.vpcc.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_vpca-vpcc.id
    depends_on = [ aws_route_table.pb_rt_tb_vpca ]
}

resource "aws_route" "rt_pb_vpcc_peer_C-A" {
    route_table_id = aws_route_table.pb_rt_tb_vpcc.id
    destination_cidr_block = aws_vpc.vpca.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_vpca-vpcc.id
    depends_on = [ aws_route_table.pb_rt_tb_vpcc ]
}
