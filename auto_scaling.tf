resource "aws_autoscaling_group" "asg" {
  name = "cloud-computing-asg"
  launch_configuration = aws_launch_configuration.launch_config.name
  max_size = 3
  min_size = 2
  availability_zones = var.availability_zones

  lifecycle {
    create_before_destroy = true
  }
}