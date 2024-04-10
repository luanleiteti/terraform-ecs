resource "aws_iam_role" "ecs" {
  assume_role_policy = data.aws_iam_policy_document.ecs_role_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_admin_role_policy" {
  role       = aws_iam_role.ecs.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}


resource "aws_iam_role" "ec2" {
  assume_role_policy = data.aws_iam_policy_document.ec2_role_assume_role_policy.json
}


resource "aws_iam_role_policy_attachment" "ec2_admin_role_policy" {
  role       = aws_iam_role.ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "ec2" {
  role = aws_iam_role.ec2.name
}


resource "aws_iam_role" "ecs_task_execution_role" {
  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_s3_bucket_policy" "main_alb_bucket_policy" {
  bucket = var.main_alb_bucket_logs_arn
  policy = data.aws_iam_policy_document.main_elb_send_logs_policy.json
}
