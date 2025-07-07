resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "3-tier-project-vpc"
  }
}

# Public Web Subnets
resource "aws_subnet" "public_web_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "3-tier-project-public-web-1a"
  }
}

resource "aws_subnet" "public_web_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "3-tier-project-public-web-1b"
  }
}

# Private App Subnets
resource "aws_subnet" "private_app_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.11.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "3-tier-project-private-app-1a"
  }
}

resource "aws_subnet" "private_app_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.12.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "3-tier-project-private-app-1b"
  }
}

# Private DB Subnets
resource "aws_subnet" "private_db_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.21.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "3-tier-project-private-db-1a"
  }
}

resource "aws_subnet" "private_db_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.22.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "3-tier-project-private-db-1b"
  }
}
