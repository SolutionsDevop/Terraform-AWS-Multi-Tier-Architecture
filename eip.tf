# File for creating Elastic IP
# It is a static ip4 address designed for dynamic cloud
# computing. It is allocated to your aws account (copied from aws)

resource "aws_eip" "eip" {
  # domain = "vpc"
}