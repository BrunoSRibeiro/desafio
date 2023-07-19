variable "vpca_cidr" {
  description = "CIDR VPC-A"
  type = map(string)
  default = {
    name = "VPC_A"
    cidr = "10.10.0.0/16"
  }
}

variable "vpcb_cidr" {
  description = "CIDR VPC-B"
  type = map(string)
  default = {
    name = "VPC_B"
    cidr = "10.20.0.0/16"
  }
}

variable "vpcc_cidr" {
  description = "CIDR VPC-C"
  type = map(string)
  default = {
    name = "VPC_C"
    cidr = "10.30.0.0/16"
  }
}

variable "azs" {
    type = list(string)
    description = "Zonas de disponibilidade"
    default = ["us-east-1a","us-east-1b","us-east-1c"]
}

variable "customer_a_ips"{
  description = "IPs do Cliente A"
  type = map(string)
  default = {
    external = "34.201.10.76"
    internal = "10.100.0.0/16"
  }
}
