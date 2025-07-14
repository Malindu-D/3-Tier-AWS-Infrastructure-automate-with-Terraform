# Web Security Group
resource "aws_security_group" "web" {
  name        = "3-tier-project-web-sg"
  description = "Allow SSH from anywhere"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "3-tier-project-web-sg"
  }
}

# App Security Group
resource "aws_security_group" "app" {
  name        = "3-tier-project-app-sg"
  description = "Allow SSH from web subnets only"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from web subnets"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "10.10.1.0/24", # public_web_1a
      "10.10.2.0/24"  # public_web_1b
    ]
  }

  ingress {
    description = "HTTP from web subnets"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      "10.10.1.0/24", # public_web_1a
      "10.10.2.0/24"  # public_web_1b
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "3-tier-project-app-sg"
  }
}

# DB Security Group
resource "aws_security_group" "db" {
  name        = "3-tier-project-db-sg"
  description = "Allow SSH from web subnets only"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from web subnets"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "10.10.1.0/24", # public_web_1a
      "10.10.2.0/24"  # public_web_1b
    ]
  }

  ingress {
    description = "MySQL from app subnets"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [
      "10.10.11.0/24", # private_app_1a
      "10.10.12.0/24"  # private_app_1b
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "3-tier-project-db-sg"
  }
}
