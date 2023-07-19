resource "aws_ec2_transit_gateway_route_table" "rt_tb_vpn-vpca_tgw" {
  transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
  tags = {
      Name = "${var.vpca_cidr["name"]}_VPN_Cliente_A_tgw_rt_tb"
    }
}

resource "aws_ec2_transit_gateway_route_table_association" "rt_tb_vpn-vpca_ass_tgw" {
    transit_gateway_attachment_id = aws_vpn_connection.vpn_cliente_a.transit_gateway_attachment_id
    transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpn-vpca_tgw.id 
}

resource "aws_ec2_transit_gateway_route" "rt_vpn-vpca_tgw" {
  destination_cidr_block = aws_vpc.vpca.cidr_block
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpca_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_tb_vpn-vpca_tgw.id 
}
