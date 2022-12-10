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