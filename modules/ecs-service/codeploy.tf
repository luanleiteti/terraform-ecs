resource "aws_codedeploy_app" "main_code_deploy_app" {
  compute_platform = "ECS"
  name             = "${var.stage}-${var.project_name}-ecs-service_app"
}

resource "aws_codedeploy_deployment_config" "main_code_deploy_deployment_config" {
  deployment_config_name = "${var.stage}-${var.project_name}-ecs-service_deployment-config"
  compute_platform       = "ECS"

  traffic_routing_config {
    type = "TimeBasedCanary"
    time_based_canary {
      interval   = 1
      percentage = 50
    }
  }
}


resource "aws_codedeploy_deployment_group" "main_code_deploy_deployment_group" {
  app_name               = aws_codedeploy_app.main_code_deploy_app.name
  deployment_config_name = aws_codedeploy_deployment_config.main_code_deploy_deployment_config.deployment_config_name
  deployment_group_name  = "${var.stage}-${var.project_name}-ecs-service_deployment-group"
  service_role_arn       = var.codedeploy_role_arn

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }

    terminate_blue_instances_on_deployment_success {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = 1
    }
  }

  trigger_configuration {
    trigger_events     = ["DeploymentFailure", "DeploymentStart", "DeploymentSuccess", "DeploymentStop", "DeploymentRollback"]
    trigger_name       = "${var.stage}-${var.project_name}-ecs-service_trigger"
    trigger_target_arn = aws_sns_topic.main_sns_code_deploy_topic.arn
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  ecs_service {
    cluster_name = var.ecs_cluster_name
    service_name = aws_ecs_service.main_service.name
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [var.main_alb_listener_https]
      }

      test_traffic_route {
        listener_arns = [var.main_alb_listener_https_green]
      }

      target_group {
        name = var.main_alb_target_group_blue
      }

      target_group {
        name = var.main_alb_target_group_green
      }
    }
  }
}

