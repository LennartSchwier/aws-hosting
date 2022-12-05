data "aws_ami" "ubuntu" {
  owners = ["self"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
}

resource "aws_launch_configuration" "launch_config" {
  name_prefix = "cloud-programming-launch-config-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }
}
