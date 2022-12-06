data "aws_instances" "instances" {
}

output "public_ip" {
  value = data.aws_instances.instances.public_ips
}