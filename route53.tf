resource "aws_route53_record" "www_cname" {
  zone_id = var.aws_hosted_zone_id
  name    = "www.malindud.works"
  type    = "CNAME"
  ttl     = 300
  records = ["malindud.works"]
}

resource "aws_route53_record" "root_alias" {
  zone_id = var.aws_hosted_zone_id
  name    = "malindud.works"
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }
}
