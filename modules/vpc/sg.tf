resource "aws_security_group" "pub_sg" {
  name       = "${var.project_name}-security-group-public"
  vpc_id     = aws_vpc.vpc.id
  depends_on = [aws_vpc.vpc]

  /*
    If you want to allow traffic from a VPC, you can use
    [aws_vpc.vpc.cidr_block]

    Do not give access to everyone! You can for example use your
    own IP.
  */
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.sg_cidr_blocks_inbound}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.sg_cidr_blocks_outbound}"]
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
    Name        = "${var.project_name}-security-group-public"
    Environment = "${var.environment}-security-group-public"
  }
}

resource "aws_security_group" "priv_sg" {
  name       = "${var.project_name}-security-group-private"
  vpc_id     = aws_vpc.vpc.id
  depends_on = [aws_vpc.vpc]

  // Only allowing traffic from a VPC public subnet
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.sg_cidr_blocks_outbound}"]
  }

  tags = {
    Name        = "${var.project_name}-security-group-private"
    Environment = "${var.environment}-security-group-private"
  }
}
