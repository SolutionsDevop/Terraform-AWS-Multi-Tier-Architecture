# A load balancer serves as the single point of contact for all clients
# It distribute incoming traffic across multiple targets e.g ec2,
# instances in multiple azs. This increases the availability of your
# application. You add one or more listeners to your load balancer (copied AWS)
# Config file to create application load balancer for the 
# web tier

resource "aws_lb" "alb-web" {
  name               = var.alb-web-name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group-web.id]
  subnets            = [aws_subnet.web-subnet1.id, aws_subnet.web-subnet2.id]
}
