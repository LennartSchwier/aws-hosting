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