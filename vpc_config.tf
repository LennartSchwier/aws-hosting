resource "aws_vpc" "main" {
  cidr_block = var.cidr_block_vpc

  tags = {
    Name = "main"
  }
}

resource "aws_default_route_table" "main_rt" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_sn_main" {
  count = length(data.aws_availability_zones.availability_zones.names)

  vpc_id = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.availability_zones.names[count.index]
  cidr_block = var.cidr_blocks_subnets[count.index]

  tags = {
    Name = "main"
  }
}