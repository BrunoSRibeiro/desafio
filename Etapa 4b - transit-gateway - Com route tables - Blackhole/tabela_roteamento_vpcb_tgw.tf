resource "aws_ec2_transit_gateway_route_table" "rt_tb_vpcb_tgw" {
  transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
  tags = {
      Name = "${var.vpcb_cidr["name"]}_tgw_rt_tb"
    }
}

resource "aws_ec2_transit_gateway_route_table_association" "rt_tb_vpcb_ass_tgw" {
    transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpcb_attachment.id
    transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpcb_tgw.id 
}

resource "aws_ec2_transit_gateway_route" "rt_pvcb-vpca_tgw" {
  destination_cidr_block = aws_vpc.vpca.cidr_block
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpca_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpcb_tgw.id
}

resource "aws_ec2_transit_gateway_route" "rt_pvcb-vpcc_tgw" {
  destination_cidr_block = aws_vpc.vpcc.cidr_block
  blackhole = true
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpcb_tgw.id
} 