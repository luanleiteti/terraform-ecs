locals {
  public_subnet = [
    "${lookup(var.cidr_ip_block, var.stage)}.10.0/24",
    "${lookup(var.cidr_ip_block, var.stage)}.20.0/24",
    "${lookup(var.cidr_ip_block, var.stage)}.30.0/24",
  ]
  private_subnet = [
    "${lookup(var.cidr_ip_block, var.stage)}.40.0/24",
    "${lookup(var.cidr_ip_block, var.stage)}.50.0/24",
    "${lookup(var.cidr_ip_block, var.stage)}.60.0/24",
  ]
  db_private_subnet = [

    "${lookup(var.cidr_ip_block, var.stage)}.70.0/24",
    "${lookup(var.cidr_ip_block, var.stage)}.80.0/24",
    "${lookup(var.cidr_ip_block, var.stage)}.90.0/24",
  ]

  availability_zone = data.aws_availability_zones.available_zones.names

  queue = {
    "0" = {
      cidr_block  = local.private_subnet[0]
      rule_number = 100
    }

    "1" = {
      cidr_block  = local.private_subnet[1]
      rule_number = 200
    }

    "2" = {
      cidr_block  = local.private_subnet[2]
      rule_number = 300
    }
  }
}
