# Web Tier EC2 Instances (Public Subnets)
resource "aws_instance" "web_1a" {
  ami                         = "ami-020cba7c55df1f615"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_web_1a.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true
  key_name                    = "3-tier-project-public-key"

  tags = {
    Name = "3-tier-project-ec2-web-1a"
  }
}

resource "aws_instance" "web_1b" {
  ami                         = "ami-020cba7c55df1f615"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_web_1b.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true
  key_name                    = "3-tier-project-public-key"

  tags = {
    Name = "3-tier-project-ec2-web-1b"
  }
}

# App Tier EC2 Instances (Private Subnets)
resource "aws_instance" "app_1a" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_app_1a.id
  vpc_security_group_ids = [aws_security_group.app.id]
  key_name               = "3-tier-project-private-key"

  tags = {
    Name = "3-tier-project-ec2-app-1a"
  }
}

resource "aws_instance" "app_1b" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_app_1b.id
  vpc_security_group_ids = [aws_security_group.app.id]
  key_name               = "3-tier-project-private-key"

  tags = {
    Name = "3-tier-project-ec2-app-1b"
  }
}

# DB Tier EC2 Instances (Private Subnets)
resource "aws_instance" "db_1a" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_db_1a.id
  vpc_security_group_ids = [aws_security_group.db.id]
  key_name               = "3-tier-project-private-key"

  tags = {
    Name = "3-tier-project-ec2-db-1a"
  }
}

resource "aws_instance" "db_1b" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_db_1b.id
  vpc_security_group_ids = [aws_security_group.db.id]
  key_name               = "3-tier-project-private-key"

  tags = {
    Name = "3-tier-project-ec2-db-1b"
  }
}
