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

resource "aws_launch_template" "launch_template" {
  name_prefix = "cloud-programming-launch-config-"
  image_id = data.aws_ami.amazon_linux_2_kernel_5.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_access.id]
  user_data = filebase64("${path.module}/user_data.sh")

  lifecycle {
    create_before_destroy = true
  }
}