data "aws_vpcs" "default_vpc" {
  filter {
    name   = "is-default"
    values = [true]
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.default_vpc.ids
  }
}

data "aws_availability_zones" "availability_zones" {
  state = "available"
}

data "aws_ami" "amazon_linux_2_kernel_5" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0*x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}