# Amazon VPC is a service that lets you launch AWS resources in a logigically isolated 
# virtual network that you defined (copied for AWS)
# This allows you to have control over your own virtual network environment
# Just like you will operate in your own data center

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr-block
  tags = {
    Name = var.vpc-name
  }
}