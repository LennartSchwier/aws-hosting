resource "aws_autoscaling_group" "asg" {
  name = "cloud-computing-asg"
  max_size = 3
  min_size = 2
  desired_capacity = 2
  availability_zones = var.availability_zones

  launch_template {
    id = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  lifecycle {
    create_before_destroy = true
  }
}