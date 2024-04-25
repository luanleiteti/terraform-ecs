resource "aws_sns_topic" "main_sns_code_deploy_topic" {
  name              = "${var.stage}-${var.project_name}-sns-code-deploy-topic"
  kms_master_key_id = "alias/aws/sns"
  policy            = var.sns_topic_policy_document
}

resource "aws_sns_topic_subscription" "main_sqs_target" {
  topic_arn = aws_sns_topic.main_sns_code_deploy_topic.arn
  protocol  = "email"
  endpoint  = var.email_to_send_notifications
}