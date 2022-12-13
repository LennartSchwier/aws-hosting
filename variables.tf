variable "region" {
  description = "region for AWS resources"
  type = string
}

variable "instance_type" {
  description = "type of instance"
  type = string
}

variable "max_size" {
  description = "maximum number of instances"
  type = number
}

variable "min_size" {
  description = "minimum number of instances"
  type = number
}

variable "desired_capacity" {
  description = "desired number of instances"
  type = number
}