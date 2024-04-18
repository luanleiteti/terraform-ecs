resource "aws_network_acl" "db_receive_traffic_acl" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.stage}-db-acl-receive-traffic-from-private-subnets"
  }
}

resource "aws_network_acl_rule" "db_receive_traffic_acl_ingress" {
  for_each       = local.queue
  network_acl_id = aws_network_acl.db_receive_traffic_acl.id
  rule_number    = each.value.rule_number
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = false
  from_port      = 5432
  to_port        = 5432
  cidr_block     = each.value.cidr_block
}

resource "aws_network_acl_rule" "db_receive_traffic_acl_egress" {
  for_each       = local.queue
  network_acl_id = aws_network_acl.db_receive_traffic_acl.id
  rule_number    = each.value.rule_number
  protocol       = "tcp"
  rule_action    = "allow"
  egress         = true
  from_port      = 5432
  to_port        = 5432
  cidr_block     = each.value.cidr_block
}

resource "aws_network_acl_association" "db_receive_traffic_acl_association_1" {
  network_acl_id = aws_network_acl.db_receive_traffic_acl.id
  subnet_id      = aws_subnet.db_private_subnet_1.id

}

resource "aws_network_acl_association" "db_receive_traffic_acl_association_2" {
  network_acl_id = aws_network_acl.db_receive_traffic_acl.id
  subnet_id      = aws_subnet.db_private_subnet_2.id

}

resource "aws_network_acl_association" "db_receive_traffic_acl_association_3" {
  network_acl_id = aws_network_acl.db_receive_traffic_acl.id
  subnet_id      = aws_subnet.db_private_subnet_3.id

}
