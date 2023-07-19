resource "aws_route" "rt_pv_vpca_tgw" {
    route_table_id = aws_route_table.pv_rt_tb_vpca.id
    destination_cidr_block = "0.0.0.0/0"
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
}

resource "aws_route" "rt_pv_vpcb_tgw" {
    route_table_id = aws_route_table.pv_rt_tb_vpcb.id
    destination_cidr_block = "0.0.0.0/0"
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
}

resource "aws_route" "rt_pv_vpcc_tgw" {
    route_table_id = aws_route_table.pv_rt_tb_vpcc.id
    destination_cidr_block = "0.0.0.0/0"
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
}

resource "aws_route" "rt_pv_vpcd_tgw" {
    provider = aws.remote
    route_table_id = aws_route_table.pv_rt_tb_vpcd.id
    destination_cidr_block = "0.0.0.0/0"
    transit_gateway_id = aws_ec2_transit_gateway.tgwb.id
}