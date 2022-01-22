resource "aws_security_group" "sg" {
  name       = "${var.project_name}-security-group"
  vpc_id     = aws_vpc.vpc.id
  depends_on = [aws_vpc.vpc]

  // If you want to use a variable for cidr_blocks
  // find sg_cidr_blocks_inbound and sg_cidr_blocks_outbound
  // and replace it in cidr_blocks
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
    // ["${var.sg_cidr_blocks_outbound}"]
  }

  // Restricting outbound rules with cidr_block
  // Allowing all outbound traffic though
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
    // ["${var.sg_cidr_blocks_outbound}"]
  }

/*
  ingress {
    description = "Allow TLS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ""
    // self     = true
  }

  egress {
    from_port   =
    to_port     =
    protocol    = ""
    cidr_blocks = ""
    // self     = true
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ""
    // self     = true
  }

  egress {
    from_port   =
    to_port     =
    protocol    = ""
    cidr_blocks = ""
    // self     = true
  }
*/

  tags = {
    Name        = "${var.project_name}-security-group"
    Environment = "${var.environment}-security-group"
  }
}
