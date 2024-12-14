data "aws_caller_identity" "current" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  # name        = "user-service"
  use_name_prefix = true
  name = "mysg"
  
  description = "Security group for ssh"
  vpc_id      = data.aws_subnet.selected.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_rules      = ["all-all"]
  # ingress_with_cidr_blocks = [
  #   {
  #     from_port   = 8080
  #     to_port     = 8090
  #     protocol    = "tcp"
  #     description = "User-service ports"
  #     cidr_blocks = "10.10.0.0/16"
  #   },
  #   {
  #     rule        = "postgresql-tcp"
  #     cidr_blocks = "0.0.0.0/0"
  #   },
  # ]

  tags = local.tags
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name_prefix    = "deployer-"
  create_private_key = true


  tags = local.tags
}

resource "local_file" "ssh_key" {
  filename = "key.pem"
  content = module.key_pair.private_key_pem
  directory_permission = "0400"
  file_permission = "0400"
}


resource "aws_instance" "terraform_ec2_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.ssh_active ? module.key_pair.key_pair_name : null
  vpc_security_group_ids = [module.security_group.security_group_id]
  associate_public_ip_address = var.public_access ? true : false

  tags = local.tags
}
