resource "aws_lb_target_group" "lb_target_group" {
  name = "cloud-programming-tg"
  protocol = "HTTP"
  port = "80"
  vpc_id = var.vpc_id
}

resource "aws_lb" "alb" {
  name = "cloud-programming-lb"
  load_balancer_type = "application"
  security_groups = [aws_security_group.http_port80.id]
  subnets = data.aws_subnets.subnets.ids

  enable_deletion_protection = false
}

output "lb_dns_name" {
  value = aws_lb.alb.dns_name
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.id
  port = 80
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.id
  }
}