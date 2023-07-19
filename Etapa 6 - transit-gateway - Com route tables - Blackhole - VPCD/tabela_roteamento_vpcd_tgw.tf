resource "aws_ec2_transit_gateway_route_table" "rt_tb_vpcd_tgw" {
  provider = aws.remote
  transit_gateway_id = aws_ec2_transit_gateway.tgwb.id
  tags = {
      Name = "${var.vpcd_cidr["name"]}_tgw_rt_tb"
    }
}

resource "aws_ec2_transit_gateway_route_table_association" "rt_tb_vpcd_ass_tgwb" {
  provider = aws.remote
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpcd_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpcd_tgw.id 
}

resource "aws_ec2_transit_gateway_route" "rt_vpcd-vpca_tgwb" {
  depends_on = [ aws_ec2_transit_gateway_peering_attachment.tgwb_attachment ]
  provider = aws.remote
  destination_cidr_block = aws_vpc.vpca.cidr_block
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tgwb_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpcd_tgw.id
}


resource "aws_ec2_transit_gateway_route" "rt_vpcd-vpca_tgwb_peering" {
  depends_on = [ aws_ec2_transit_gateway_peering_attachment.tgwb_attachment ]
  provider = aws.remote
  destination_cidr_block = aws_vpc.vpca.cidr_block
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tgwb_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.tgwb.association_default_route_table_id
}
