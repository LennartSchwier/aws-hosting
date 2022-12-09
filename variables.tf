variable "region" {
  description = "region for AWS resources"
  type = string
  default = "eu-central-1"
}

variable "instance_type" {
  description = "type of instance"
  type = string
  default = "t2.micro"
}

variable "availability_zones" {
  description = "availability zones"
  type = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}

variable "vpc_id" {
  description = "VPC id"
  type = string
  default = "vpc-cce757a6"
}

variable "cidr_block_vpc" {
  description = "cidr block assigned to vpc"
  type = string
  default = "172.27.0.0/16"
}

variable "cidr_blocks_subnets" {
  description = "cidr blocks assigned to subnets"
  type = list(string)
  default = ["172.27.0.0/20", "172.27.16.0/20", "172.27.32.0/20"]
}