resource "aws_security_group" "sg" {
  name       = "${var.project_name}-security-group"
  vpc_id     = aws_vpc.vpc.id
  depends_on = [aws_vpc.vpc]

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.sg_cidr_blocks_inbound}"]
  }

  // Although I'm not restricting outbound rules here in this case
  // it definitely should be (this is just a demo project)
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
    Name        = "${var.project_name}-security-group"
    Environment = "${var.environment}-security-group"
  }
}