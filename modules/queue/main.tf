data "aws_caller_identity" "current" {}

resource "aws_sqs_queue" "terraform_queue" {
  name          = "terraform-example-queue"
  delay_seconds = var.delay_seconds
  #   max_message_size          = 2048
  #   message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  #   redrive_policy = jsonencode({
  #     deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
  #     maxReceiveCount     = 4
  #   })


  tags = local.tags
}
