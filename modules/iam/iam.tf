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


resource "aws_iam_policy" "ecs_main_kms_key_policy" {
  name        = "${var.stage}-${var.project_name}-ecs-kms-key-policy"
  description = "Policy for ECS to access the main KMS key"
  policy      = data.aws_iam_policy_document.ecs_main_kms_key_policy.json
}

resource "aws_iam_policy" "s3_main_kms_key_policy" {
  name   = "${var.stage}-${var.project_name}-s3-kms-key-policy"
  description = "Policy for S3 to access the main KMS key"
  policy = data.aws_iam_policy_document.s3_main_kms_key_policy.json
}