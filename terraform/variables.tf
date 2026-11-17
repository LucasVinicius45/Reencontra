
variable "aws_region" {
  description = "Regiao AWS onde os recursos serao criados"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "reencontra"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.micro"
}
