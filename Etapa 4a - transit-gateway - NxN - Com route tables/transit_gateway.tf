resource "aws_ec2_transit_gateway" "tgwa" {
    description = "Transit Gateway"
    tags = {
       Name = "TGW_A"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpca_attachment" {
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
    transit_gateway_default_route_table_association = false
    vpc_id = aws_vpc.vpca.id
    subnet_ids = aws_subnet.subnet-pb_vpca.*.id 
    tags = {
       Name = "VPC-A_TGW"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpcb_attachment" {
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
    transit_gateway_default_route_table_association = false
    vpc_id = aws_vpc.vpcb.id
    subnet_ids = aws_subnet.subnet-pb_vpcb.*.id
    tags = {
       Name = "VPC-B_TGW"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpcc_attachment" {
    transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
    transit_gateway_default_route_table_association = false
    vpc_id = aws_vpc.vpcc.id
    subnet_ids = aws_subnet.subnet-pb_vpcc.*.id
    tags = {
       Name = "VPC-C_TGW"
    }
}
