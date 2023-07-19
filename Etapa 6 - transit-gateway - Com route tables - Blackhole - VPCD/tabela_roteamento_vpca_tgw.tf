resource "aws_ec2_transit_gateway_route_table" "rt_tb_vpca_tgw" {
  transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
  tags = {
      Name = "${var.vpca_cidr["name"]}_tgw_rt_tb"
    }
}

resource "aws_ec2_transit_gateway_route_table_association" "rt_tb_vpca_ass_tgw" {
    transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpca_attachment.id
    transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpca_tgw.id 
}

resource "aws_ec2_transit_gateway_route" "rt_vpca-vpcb_tgw" {
  destination_cidr_block = aws_vpc.vpcb.cidr_block
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpcb_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpca_tgw.id
}

resource "aws_ec2_transit_gateway_route" "rt_vpca-vpcc_tgw" {
  destination_cidr_block = aws_vpc.vpcc.cidr_block
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpcc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpca_tgw.id
}

resource "aws_ec2_transit_gateway_route" "rt_vpca-vpcd_tgw" {
  depends_on = [ aws_ec2_transit_gateway_peering_attachment.tgwb_attachment ]
  destination_cidr_block = aws_vpc.vpcd.cidr_block
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tgwb_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpca_tgw.id
}

resource "aws_ec2_transit_gateway_route" "rt_vpca-vpcd_tgwb" {
  depends_on = [ aws_ec2_transit_gateway_peering_attachment.tgwb_attachment ]
  destination_cidr_block = aws_vpc.vpcd.cidr_block
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tgwb_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.tgwa.association_default_route_table_id
}
