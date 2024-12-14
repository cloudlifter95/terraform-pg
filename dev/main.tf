data "aws_caller_identity" "current" {}

module "sqs_queue" {
  source = "../modules/queue"
  providers = {
    aws = aws.jakarta
  }
  custom_tags   = local.tags
  delay_seconds = 90
}

module "ec2_instance" {
  source = "../modules/ec2"
  providers = {
    aws = aws.frankfurt
  }
  custom_tags   = local.tags
  instance_type = "t3.small"
  subnet_id     = "subnet-0beae42b1de93e5aa"
  ssh_active = true
  public_access = true
  
}
