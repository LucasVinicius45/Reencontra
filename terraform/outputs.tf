
output "aws_region" {
  description = "Regiao AWS configurada"
  value       = var.aws_region
}

output "project_name" {
  description = "Nome do projeto"
  value       = var.project_name
}

output "instance_type" {
  description = "Tipo de instancia EC2 configurado"
  value       = var.instance_type
}


output "ec2_public_ip" {
  description = "IP publico da instancia Reencontra"
  value       = aws_instance.reencontra.public_ip
}

output "reencontra_url" {
  description = "Endereco HTTP do Reencontra"
  value       = "http://${aws_instance.reencontra.public_ip}:8080"
}
