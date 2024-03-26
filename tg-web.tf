# Config file for target group
# Target group routes requests to individual targets such as
# ec2 instance using the protocol and port number that you specify
# you can register a target with multiple target groups and configure
# checks on on a per target goup (copied AWS)

resource "aws_lb_target_group" "target-group-web" {
  name     = var.tg-web-name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  health_check {
    path    = "/"
    matcher = 200
  }
}

resource "aws_lb_listener" "alb_listener-web" {
  load_balancer_arn = aws_lb.alb-web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group-web.arn
  }
}