output "current_aws_config" {
  value = data.aws_caller_identity.current
}

output "ec2_instance" {
  value = aws_instance.terraform_ec2_instance
}

output "key_pair" {
  value = module.key_pair
}

output "security_group" {
  value = module.security_group
}