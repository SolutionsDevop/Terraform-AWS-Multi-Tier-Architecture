# This is the config file for the web-tier section
# Web tier is the entry point for incoming user requests
# this includes the load balancer, the autoscaling group
# and security group. LB - distributes traffic acrros multipl servers
# AG - this automatically adjust the # of web servers based on traffic
# SG - controls incoming ad outgoing traffic to the web servers

resource "aws_launch_template" "template-web" {
  name          = var.launch-template-web-name
  image_id      = var.image-id
  instance_type = var.instance-type
  key_name      = var.key-name

  network_interfaces {
    device_index    = 0
    security_groups = [aws_security_group.asg-security-group-web.id]
  }

  user_data = filebase64("user-data.sh")
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.web-instance-name
    }
  }
}