resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr_block}"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.project_name}-vpc"
    Environment = "${var.environment}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.project_name}-igw"
    Environment = "${var.environment}-igw"
  }
}

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name        = "${var.project_name}-nat-eip"
    Environment = "${var.environment}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.pub_subnet.id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name        = "${var.project_name}-nat"
    Environment = "${var.environment}-nat"
  }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "${var.pub_subnet_cidr}"
  availability_zone = "${var.pub_zone}"

  tags = {
    Name        = "${var.project_name}-pub-subnet"
    Environment = "${var.environment}-pub-subnet"
  }
}

resource "aws_subnet" "priv_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "${var.priv_subnet_cidr}"
  availability_zone = "${var.priv_zone}"

  tags = {
    Name        = "${var.project_name}-priv-subnet"
    Environment = "${var.environment}-priv-subnet"
  }
}

resource "aws_route_table" "pub_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.project_name}-pub-route-table"
    Environment = "${var.environment}-pub-route-table"
  }
}

resource "aws_route_table" "priv_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.project_name}-priv-route-table"
    Environment = "${var.environment}-priv-route-table"
  }
}

resource "aws_route" "pub_igw" {
  route_table_id         = aws_route_table.pub_route_table.id
  destination_cidr_block = "${var.route_destination_cidr_block}"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "priv_nat" {
  route_table_id         = aws_route_table.priv_route_table.id
  destination_cidr_block = "${var.route_destination_cidr_block}"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "pub_route_table_association" {
  subnet_id      = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.pub_route_table.id
}

resource "aws_route_table_association" "priv_route_table_association" {
  subnet_id      = aws_subnet.priv_subnet.id
  route_table_id = aws_route_table.priv_route_table.id
}
