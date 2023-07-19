resource "aws_ec2_transit_gateway" "tgwb" {
    provider = aws.remote
    description = "Transit Gateway B"
    default_route_table_propagation = "enable"
    default_route_table_association = "enable"
    tags = {
       Name = "TGW_B"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpcd_attachment" {
    provider = aws.remote
    transit_gateway_id = aws_ec2_transit_gateway.tgwb.id
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = true
    vpc_id = aws_vpc.vpcd.id
    subnet_ids = aws_subnet.subnet-pb_vpcd.*.id 
    tags = {
       Name = "VPC-D_TGWB"
    }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "acpt_tgwb" {
    provider = aws.remote
    transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tgwb_attachment.id
}
