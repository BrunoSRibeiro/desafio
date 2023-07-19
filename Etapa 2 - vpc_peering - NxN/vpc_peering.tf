resource "aws_vpc_peering_connection" "vpc_peer_vpca-vpcb" {
    peer_vpc_id = aws_vpc.vpcb.id
    vpc_id  = aws_vpc.vpca.id
    auto_accept = true
    tags = {
        Name = "VPC Peering VPC-A - VPC-B"
    }
}

resource "aws_vpc_peering_connection" "vpc_peer_vpca-vpcc" {
    peer_vpc_id = aws_vpc.vpcc.id
    vpc_id  = aws_vpc.vpca.id
    auto_accept = true
    tags = {
        Name = "VPC Peering VPC-A - VPC-C"
    }
}