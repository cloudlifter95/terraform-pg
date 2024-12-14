output "current_aws_config" {
  value = data.aws_caller_identity.current
}

output "queue" {
  value = aws_sqs_queue.terraform_queue
}