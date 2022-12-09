resource "aws_autoscaling_group" "asg" {
  name = "cloud-computing-asg"
  max_size = 3
  min_size = 2
  desired_capacity = 2
  vpc_zone_identifier = [for subnet in aws_subnet.private_sn_main : subnet.id]
  #availability_zones = [for subnet in aws_subnet.public_sn_main : subnet.availability_zone]

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