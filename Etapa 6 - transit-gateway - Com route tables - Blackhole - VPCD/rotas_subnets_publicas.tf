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

resource "aws_route" "rt_pb_vpcd_int_gw" {
    provider = aws.remote
    route_table_id = aws_route_table.pb_rt_tb_vpcd.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.int_gw_vpcd.id
}

resource "aws_route" "rt_pb_vpca-vpcb_tgw" {
    route_table_id = aws_route_table.pb_rt_tb_vpca.id
    destination_cidr_block = aws_vpc.vpcb.cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
}

resource "aws_route" "rt_pb_vpca-vpcc_tgw" {
    route_table_id = aws_route_table.pb_rt_tb_vpca.id
    destination_cidr_block = aws_vpc.vpcc.cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
}

resource "aws_route" "rt_pb_vpca-vpcd_tgw" {
    route_table_id = aws_route_table.pb_rt_tb_vpca.id
    destination_cidr_block = aws_vpc.vpcd.cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
}

resource "aws_route" "rt_pb_vpcb-vpca_tgw" {
    route_table_id = aws_route_table.pb_rt_tb_vpcb.id
    destination_cidr_block = aws_vpc.vpca.cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
}

resource "aws_route" "rt_pb_vpcb-vpcc_tgw" {
    route_table_id = aws_route_table.pb_rt_tb_vpcb.id
    destination_cidr_block = aws_vpc.vpcc.cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
}

resource "aws_route" "rt_pb_vpcc-vpca_tgw" {
    route_table_id = aws_route_table.pb_rt_tb_vpcc.id
    destination_cidr_block = aws_vpc.vpca.cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
}

resource "aws_route" "rt_pb_vpcc-vpcb_tgw" {
    route_table_id = aws_route_table.pb_rt_tb_vpcc.id
    destination_cidr_block = aws_vpc.vpcb.cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
}

resource "aws_route" "rt_pb_vpcd-vpca_tgw" {
    provider = aws.remote
    route_table_id = aws_route_table.pb_rt_tb_vpcd.id
    destination_cidr_block = aws_vpc.vpca.cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.tgwb.id
}

