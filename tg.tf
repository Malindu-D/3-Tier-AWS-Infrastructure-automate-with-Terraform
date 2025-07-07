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

#Register EC2s to Target Group

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
