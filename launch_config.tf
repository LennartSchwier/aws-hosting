data "aws_ami" "amazon_linux_2" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_launch_configuration" "launch_config" {
  name_prefix = "cloud-programming-launch-config-"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              python3 -m http.server 8080 &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}
