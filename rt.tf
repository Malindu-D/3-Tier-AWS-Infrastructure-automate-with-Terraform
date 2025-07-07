# Web Tier Route Table (Public)
resource "aws_route_table" "web" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "3-tier-project-web-rt"
  }
}

resource "aws_route" "web_internet" {
  route_table_id         = aws_route_table.web.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "web_1a" {
  subnet_id      = aws_subnet.public_web_1a.id
  route_table_id = aws_route_table.web.id
}

resource "aws_route_table_association" "web_1b" {
  subnet_id      = aws_subnet.public_web_1b.id
  route_table_id = aws_route_table.web.id
}

# App Tier Route Table (Private)
resource "aws_route_table" "app" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "3-tier-project-app-rt"
  }
}

resource "aws_route" "app_nat" {
  route_table_id         = aws_route_table.app.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}

resource "aws_route_table_association" "app_1a" {
  subnet_id      = aws_subnet.private_app_1a.id
  route_table_id = aws_route_table.app.id
}

resource "aws_route_table_association" "app_1b" {
  subnet_id      = aws_subnet.private_app_1b.id
  route_table_id = aws_route_table.app.id
}

# DB Tier Route Table (Private)
resource "aws_route_table" "db" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "3-tier-project-db-rt"
  }
}

resource "aws_route" "db_nat" {
  route_table_id         = aws_route_table.db.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}

resource "aws_route_table_association" "db_1a" {
  subnet_id      = aws_subnet.private_db_1a.id
  route_table_id = aws_route_table.db.id
}

resource "aws_route_table_association" "db_1b" {
  subnet_id      = aws_subnet.private_db_1b.id
  route_table_id = aws_route_table.db.id
}
