
resource aws_default_vpc default {
  count = var.account_info.manage_default_security_group ? 1 : 0
}

resource aws_default_security_group default {
  count  = var.account_info.manage_default_security_group ? 1 : 0
  vpc_id = aws_default_vpc.default[0].id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  ingress {
    description = "ssh access, use ec2 instant connect"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
