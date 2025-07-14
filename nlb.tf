resource "aws_lb" "db_nlb" {
  name               = "3-tier-project-db-nlb"
  internal           = true
  load_balancer_type = "network"
  subnets            = [
    aws_subnet.private_db_1a.id,
    aws_subnet.private_db_1b.id
  ]
  tags = {
    Name = "3-tier-project-db-nlb"
  }
}

# Listener for Port 80
resource "aws_lb_listener" "db_nlb_80" {
  load_balancer_arn = aws_lb.db_nlb.arn
  port              = 80
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.db_80.arn
  }
}

# Listener for Port 3306
resource "aws_lb_listener" "db_nlb_3306" {
  load_balancer_arn = aws_lb.db_nlb.arn
  port              = 3306
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.db_3306.arn
  }
}
