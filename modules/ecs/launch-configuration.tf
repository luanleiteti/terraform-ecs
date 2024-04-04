resource "aws_launch_template" "main_launch_template_ecs" {
    name_prefix   = "${var.stage}-${var.project_name}-ecs-launch-template"
    image_id      = data.aws_ssm_parameter.ecs_ami.value
    instance_type = var.ecs_instance_type
    key_name      = var.ecs_key_name
    user_data     = base64encode(data.template_file.bootstrap_script.rendered)
    vpc_security_group_ids = [var.security_group_ids]
    
    iam_instance_profile {
        name = aws_iam_instance_profile.ec2.name
    }
    
    tags = {
        Name = "${var.stage}-${var.project_name}-ecs-launch-template"
    }
}