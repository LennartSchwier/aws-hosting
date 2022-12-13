resource "aws_launch_template" "launch_template" {
  name_prefix = "${var.project_name}-"
  image_id = data.aws_ami.amazon_linux_2_kernel_5.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_access.id]
  user_data = filebase64("${path.module}/ec2_user_data.sh")

  lifecycle {
    create_before_destroy = true
  }
}