resource "aws_iam_role" "ecs" {
  name               = "${var.stage}-${var.project_name}-ecs-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_role_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_admin_role_policy" {
  role       = aws_iam_role.ecs.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}


resource "aws_iam_role" "ec2" {
  name               = "${var.stage}-${var.project_name}-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_role_assume_role_policy.json
}

#TODO: review this policy for more restrictive permissions
resource "aws_iam_role_policy_attachment" "ec2_admin_role_policy" {
  role       = aws_iam_role.ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "ec2" {
  role = aws_iam_role.ec2.name
}


resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.stage}-${var.project_name}-ecs-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_s3_bucket_policy" "main_alb_bucket_policy" {
  bucket = var.main_alb_bucket_logs_name
  policy = data.aws_iam_policy_document.main_elb_send_logs_policy.json
}


resource "aws_iam_role" "codedeploy_role" {
  name               = "${var.stage}-${var.project_name}-codedeploy-role"
  assume_role_policy = data.aws_iam_policy_document.codedeploy_assume_role_policy.json
}


resource "aws_iam_role_policy_attachment" "codedeploy_role_policy" {
  role       = aws_iam_role.codedeploy_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

resource "aws_iam_role_policy_attachment" "codedeploy_manage_ecs_role_policy" {
  role       = aws_iam_role.codedeploy_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}


resource "aws_iam_role" "main_ecs_service_role" {
  name =  "${var.stage}-${var.project_name}-ecs-service-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_service_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "main_ecs_service_role_policy" {
  role       = aws_iam_role.main_ecs_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

resource "aws_iam_role_policy_attachment" "main_elbv2_ecs_service_role_policy" {
  role       = aws_iam_role.codedeploy_role.name
  policy_arn = aws_iam_policy.main_elbv2_ecs_service_role_policy.arn
}


resource "aws_iam_policy" "main_elbv2_ecs_service_role_policy" {
  name        = "${var.stage}-${var.project_name}-elbv2-ecs-service-policy"
  description = "Policy to allow ECS to register targets in the ELBv2"
  policy      = data.aws_iam_policy_document.main_elbv2_ecs_service_role_policy.json
}
