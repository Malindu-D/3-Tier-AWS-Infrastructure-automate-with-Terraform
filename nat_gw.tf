# Allocate an Elastic IP for the NAT Gateway
resource "aws_eip" "nat" {
  tags = {
    Name = "3-tier-project-nat-eip"
  }
}

# Create the NAT Gateway in the public subnet 1a
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_web_1a.id

  tags = {
    Name = "3-tier-project-nat-gateway"
  }
}
