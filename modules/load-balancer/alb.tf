resource "aws_lb" "main_alb" {
  name               = "${var.stage}-${var.project_name}-alb"
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.main_alb_security_group_id]
  subnets            = var.main_private_subnets_id
  idle_timeout       = 300
  access_logs {
    bucket  = aws_s3_bucket.main_alb_bucket_logs.id
    enabled = true
  }
}

resource "aws_lb_listener" "main_alb_listener_http" {
  load_balancer_arn = aws_lb.main_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      host        = "#{host}"
      path        = "/#{path}"
      port        = "443"
      protocol    = "HTTPS"
      query       = "#{query}"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "main_alb_listener_https" {
  load_balancer_arn = aws_lb.main_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = data.aws_acm_certificate.issued.arn

  default_action {
    type             = "forward"
    target_group_arn = var.main_alb_target_group_arn
  }
}

resource "aws_lb_listener_rule" "main_alb_listener_rule" {
  listener_arn = aws_lb_listener.main_alb_listener_https.arn

  action {
    type             = "forward"
    target_group_arn = var.main_alb_target_group_arn
  }

  condition {
    host_header {
      values = ["${var.domain_name}"]
    }
  }

  depends_on = [var.main_alb_target_group_arn]

}


