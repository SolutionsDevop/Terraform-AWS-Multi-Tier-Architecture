# NAT gateway is a network Network Address Translation service
# With Nat gateway instances in your private subnet can
# connect to services outside your vpc but external services
# cannot initiate a connection with those instances (Copied AWS)

resource "aws_nat_gateway" "nat-gw" {
  allocation_id     = aws_eip.eip.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.web-subnet1.id

  tags = {
    Name = var.nat-gw-name
  }

  depends_on = [aws_internet_gateway.internet-gw]
  # This is to ensure proper ordering, and to show 
  # dependency on the internet gateway for the vpc
}
