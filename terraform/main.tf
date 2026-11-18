
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Consulta a VPC padrao da AWS
data "aws_vpc" "default" {
  default = true
}

# Consulta uma subnet existente
data "aws_subnet" "reencontra" {
  id = "subnet-0782519258842560b"
}

# Firewall da instancia EC2 do Reencontra
resource "aws_security_group" "reencontra" {
  name_prefix = "reencontra-web-"
  description = "Acesso HTTP ao Reencontra"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name    = "reencontra-web"
    Project = var.project_name
  }
}

# Permite acesso publico ao site pela porta 8080
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.reencontra.id
  description       = "Acesso HTTP ao site"

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 8080
  to_port     = 8080
  ip_protocol = "tcp"
}

# Permite conexoes de saida
resource "aws_vpc_security_group_egress_rule" "outbound" {
  security_group_id = aws_security_group.reencontra.id
  description       = "Conexoes de saida"

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

# Consulta a imagem Amazon Linux 2023
data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# Servidor EC2 do Reencontra
# Excecao de seguranca: IP publico temporario para demonstracao academica.
# Risco aceito apenas no laboratorio, nao recomendado para producao.
# nosemgrep: terraform.aws.security.aws-ec2-has-public-ip.aws-ec2-has-public-ip
resource "aws_instance" "reencontra" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = var.instance_type
  user_data     = file("${path.module}/user-data.sh")

  subnet_id = data.aws_subnet.reencontra.id

  vpc_security_group_ids = [
    aws_security_group.reencontra.id
  ]

  associate_public_ip_address = true

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name    = "reencontra-server"
    Project = var.project_name
  }
}
