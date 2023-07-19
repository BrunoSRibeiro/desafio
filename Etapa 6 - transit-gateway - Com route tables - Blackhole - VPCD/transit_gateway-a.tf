resource "aws_ec2_transit_gateway" "tgwa" {
    description = "Transit Gateway"
    default_route_table_propagation = "enable"
    default_route_table_association = "enable"
    tags = {
       Name = "TGW_A"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpca_attachment" {
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = true
    vpc_id = aws_vpc.vpca.id
    subnet_ids = aws_subnet.subnet-pb_vpca.*.id 
    tags = {
       Name = "VPC-A_TGWA"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpcb_attachment" {
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = true
    vpc_id = aws_vpc.vpcb.id
    subnet_ids = aws_subnet.subnet-pb_vpcb.*.id
    tags = {
       Name = "VPC-B_TGWA"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpcc_attachment" {
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = true
    vpc_id = aws_vpc.vpcc.id
    subnet_ids = aws_subnet.subnet-pb_vpcc.*.id
    tags = {
       Name = "VPC-C_TGWA"
    }
}

resource "aws_ec2_transit_gateway_peering_attachment" "tgwb_attachment" {
    peer_account_id = aws_ec2_transit_gateway.tgwb.owner_id
    peer_region = "us-east-2"
    peer_transit_gateway_id = aws_ec2_transit_gateway.tgwb.id
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
    tags = {
      Name = "TGW"
    }
}

