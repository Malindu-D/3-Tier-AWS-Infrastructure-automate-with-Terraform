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

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}
