resource "aws_customer_gateway" "cgw_cliente_a" {
  bgp_asn = 65000
  ip_address = var.customer_a_ips["external"]
  type = "ipsec.1"
  tags = {
    Name = "Gateway Cliente A"
  }
}

resource "aws_vpn_connection" "vpn_cliente_a" {
  customer_gateway_id = aws_customer_gateway.cgw_cliente_a.id
  transit_gateway_id = aws_ec2_transit_gateway.tgwa.id
  type = aws_customer_gateway.cgw_cliente_a.type
  static_routes_only  = true
  tags = {
    Name = "VPN_Cliente_A"
  }
}
