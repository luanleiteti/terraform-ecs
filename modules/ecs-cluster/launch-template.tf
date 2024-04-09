resource "aws_launch_template" "main_launch_template_ecs" {
  name                   = "${var.stage}-${var.project_name}-ecs-launch-template"
  image_id               = data.aws_ssm_parameter.ecs_ami.value
  instance_type          = var.ecs_instance_type
  key_name               = var.ecs_key_name
  user_data              = base64encode(data.template_file.bootstrap_script.rendered)
  vpc_security_group_ids = [var.security_group_ids]

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      encrypted   = true
      volume_size = var.ecs_volume_size
      volume_type = "gp3"
    }
  }

  lifecycle {
    ignore_changes = [image_id]
  }

  iam_instance_profile {
    name = var.aws_iam_instance_profile
  }

  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
    http_endpoint               = "enabled"
  }

}
