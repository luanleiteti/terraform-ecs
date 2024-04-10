resource "aws_ecr_repository" "main_ecr_serivce_ecs" {
  name                 = "${var.stage}-${var.project_name}-ecs-registry"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }
}

resource "aws_ecr_lifecycle_policy" "main_ecr_lifecycle_policy" {
  repository = aws_ecr_repository.main_ecr_serivce_ecs.name

  policy = var.ecr_lifecycle_policy_document
}