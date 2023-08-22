locals {
  inbound_ports  = var.inbound_ports
  outbound_ports = var.outbound_ports
}
# security group
resource "aws_security_group" "security_group" {
  name        = "security group for the cluster"
  description = "Allow communication between master node and worker node"
  #   vpc_id      = aws_vpc.vpc.id
  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = [var.inbound_traffic_cidr]
    }
  }
  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = egress.value.protocol
      cidr_blocks = [var.egress_traffic_cidr]
    }
  }
}
