# Internet-Facing Web ALB
resource "aws_lb" "main" {
  name               = "3-tier-project-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web.id]
  subnets            = [
    aws_subnet.public_web_1a.id,
    aws_subnet.public_web_1b.id
  ]

  tags = {
    Name = "3-tier-project-alb"
  }
}

# Web ALB Listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}

# Internal App ALB
resource "aws_lb" "app" {
  name               = "3-tier-project-app-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app.id]
  subnets            = [
    aws_subnet.private_app_1a.id,
    aws_subnet.private_app_1b.id
  ]
  tags = {
    Name = "3-tier-project-app-alb"
  }
}

# App ALB Listener
resource "aws_lb_listener" "app_http" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}