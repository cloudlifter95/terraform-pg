output "unaliased_aws_config" {
  value = data.aws_caller_identity.current
}

output "queue_aws_config" {
  value = module.sqs_queue.current_aws_config
}

output "ec2_aws_config" {
  value = module.ec2_instance.current_aws_config
}

output "queue" {
  value = module.sqs_queue
}

output "ec2" {
  value = module.ec2_instance.ec2_instance
#   sensitive = true
}
