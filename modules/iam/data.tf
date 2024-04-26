data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "ecs_role_assume_role_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ec2_role_assume_role_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

#TODO: Rename this resource to: ecs_task_execution_assume_role_policy
data "aws_iam_policy_document" "ecs_task_execution_role_policy" {

  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_ecr_lifecycle_policy_document" "ecr_lifecycle_policy_document" {
  rule {
    priority    = 1
    description = "Expire images older than 15 days"
    selection {
      tag_status   = "any"
      count_type   = "sinceImagePushed"
      count_unit   = "days"
      count_number = 15
    }
    action {
      type = "expire"
    }
  }
}

data "aws_iam_policy_document" "main_elb_send_logs_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::127311923021:root"]
    }
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["${var.main_alb_bucket_logs_arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]
  }

}

data "aws_iam_policy_document" "codedeploy_assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}


data "aws_iam_policy_document" "main_sns_topic_policy" {
  policy_id = "${var.project_name}-sns-topic-policy"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        data.aws_caller_identity.current.account_id,
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = ["*"]

    sid = "__default_statement_ID"
  }
}

data "aws_iam_policy_document" "ecs_service_assume_role_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}