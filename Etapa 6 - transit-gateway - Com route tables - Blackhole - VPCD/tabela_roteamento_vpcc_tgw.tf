resource "aws_ec2_transit_gateway_route_table" "rt_tb_vpcc_tgw" {
  transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
  tags = {
      Name = "${var.vpcc_cidr["name"]}_tgw_rt_tb"
    }
}

resource "aws_ec2_transit_gateway_route_table_association" "rt_tb_vpcc_ass_tgw" {
    transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpcc_attachment.id
    transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpcc_tgw.id 
}

resource "aws_ec2_transit_gateway_route" "rt_pvcc-vpca_tgw" {
  destination_cidr_block = aws_vpc.vpca.cidr_block
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpca_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpcc_tgw.id
}

resource "aws_ec2_transit_gateway_route" "rt_pvcc-vpcb_tgw" {
  destination_cidr_block = aws_vpc.vpcb.cidr_block
  blackhole = true
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpcc_tgw.id
} 