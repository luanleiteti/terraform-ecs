#TODO add variables to config resource
resource "aws_lb_target_group" "main_alb_target_group" {
  name                          = "${var.stage}-${var.project_name}-alb-tg"
  port                          = var.main_containerPort
  protocol                      = "HTTP"
  vpc_id                        = var.vpc_id
  target_type                   = "instance"
  load_balancing_algorithm_type = "round_robin"
  deregistration_delay          = 30

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    protocol            = "HTTP"
    path                = var.health_check
    interval            = 40
    matcher             = "302,200,301"
  }

}

resource "aws_lb_target_group" "main_alb_target_group_green" {
  name                          = "${var.stage}-${var.project_name}-alb-tg-green"
  port                          = var.main_containerPort
  protocol                      = "HTTP"
  vpc_id                        = var.vpc_id
  target_type                   = "instance"
  load_balancing_algorithm_type = "round_robin"
  deregistration_delay          = 30

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    protocol            = "HTTP"
    path                = var.health_check
    interval            = 40
    matcher             = "302,200,301"
  }

}
