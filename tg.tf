# Web Layer Target Group
resource "aws_lb_target_group" "web" {
  name     = "3-tier-project-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    matcher             = "200-399"
  }

  target_type = "instance"

  tags = {
    Name = "3-tier-project-tg"
  }
}

#Attach Web EC2s

resource "aws_lb_target_group_attachment" "web_1a" {
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.web_1a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "web_1b" {
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.web_1b.id
  port             = 80
}

# App Layer Target Group
resource "aws_lb_target_group" "app" {
  name     = "3-tier-project-app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    matcher             = "200-399"
  }

  target_type = "instance"
  tags = {
    Name = "3-tier-project-app-tg"
  }
}

# Attach App EC2s
resource "aws_lb_target_group_attachment" "app_1a" {
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = aws_instance.app_1a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "app_1b" {
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = aws_instance.app_1b.id
  port             = 80
}

# Target Group for Port 80
resource "aws_lb_target_group" "db_80" {
  name        = "3-tier-project-db-tg-80"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"
  health_check {
    protocol = "TCP"
    port     = "80"
  }
  tags = {
    Name = "3-tier-project-db-tg-80"
  }
}

# Attach DB EC2s to port 80 TG
resource "aws_lb_target_group_attachment" "db_1a_80" {
  target_group_arn = aws_lb_target_group.db_80.arn
  target_id        = aws_instance.db_1a.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "db_1b_80" {
  target_group_arn = aws_lb_target_group.db_80.arn
  target_id        = aws_instance.db_1b.id
  port             = 80
}

# Target Group for Port 3306
resource "aws_lb_target_group" "db_3306" {
  name        = "3-tier-project-db-tg-3306"
  port        = 3306
  protocol    = "TCP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"
  health_check {
    protocol = "TCP"
    port     = "3306"
  }
  tags = {
    Name = "3-tier-project-db-tg-3306"
  }
}

# Attach DB EC2s to port 3306 TG
resource "aws_lb_target_group_attachment" "db_1a_3306" {
  target_group_arn = aws_lb_target_group.db_3306.arn
  target_id        = aws_instance.db_1a.id
  port             = 3306
}
resource "aws_lb_target_group_attachment" "db_1b_3306" {
  target_group_arn = aws_lb_target_group.db_3306.arn
  target_id        = aws_instance.db_1b.id
  port             = 3306
}