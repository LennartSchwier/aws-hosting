resource "aws_autoscaling_group" "asg" {
  name = "${var.project_name}-asg"
  max_size = var.max_size
  min_size = var.min_size
  desired_capacity = var.desired_capacity
  availability_zones = data.aws_availability_zones.availability_zones.names

  launch_template {
    id = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "asg_lb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn = aws_lb_target_group.lb_target_group.id
}