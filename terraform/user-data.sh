#!/bin/bash
set -euxo pipefail

# Atualizar o sistema
dnf update -y

# Instalar Docker e Git
dnf install -y docker git

# Iniciar Docker automaticamente
systemctl enable --now docker

# Baixar o projeto Reencontra
git clone --depth 1 \
  https://github.com/LucasVinicius45/Reencontra.git \
  /opt/reencontra

# Construir a imagem Docker
cd /opt/reencontra
docker build -t reencontra-web .

# Iniciar o site na porta 8080
docker run -d \
  --name reencontra-web \
  --restart unless-stopped \
  -p 8080:8080 \
  reencontra-web

echo "Reencontra iniciado" > /var/log/reencontra-setup.log
