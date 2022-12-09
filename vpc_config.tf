resource "aws_vpc" "main" {
  cidr_block = var.cidr_block_vpc

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_sn_main" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.cidr_block_public_subnet

  tags = {
    Name = "main-public"
  }
}

resource "aws_subnet" "private_sn_main" {
  count = min(length(data.aws_availability_zones.availability_zones.names), length(var.cidr_blocks_private_subnets))

  vpc_id = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.availability_zones.names[count.index]
  cidr_block = var.cidr_blocks_private_subnets[count.index]

  tags = {
    Name = "main-private"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "main_nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_sn_main.id
  depends_on = [aws_internet_gateway.main_igw]

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "main-public"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main_nat_gw.id
  }

  tags = {
    Name = "main-private"
  }
}

resource "aws_default_route_table" "default_rt" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route = []

  tags = {
    Name = "main-default"
  }
}