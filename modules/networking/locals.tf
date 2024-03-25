locals {
  public_subnet = [
    "${lookup(var.cidr_ip_block, var.stage)}.10.0/24",
    "${lookup(var.cidr_ip_block, var.stage)}.20.0/24",
    ]
  private_subnet = [
    "${lookup(var.cidr_ip_block, var.stage)}.30.0/24",
    "${lookup(var.cidr_ip_block, var.stage)}.40.0/24",
    ]
  
  availability_zone = data.aws_availability_zones.available_zones.names
}