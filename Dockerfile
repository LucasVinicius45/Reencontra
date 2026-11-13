
FROM nginxinc/nginx-unprivileged:stable-alpine

# Copia somente os arquivos do site
COPY --chown=101:101 app/ /usr/share/nginx/html/

# Porta HTTP utilizada pelo Nginx sem privilégios
EXPOSE 8080

# Executa o servidor
CMD ["nginx", "-g", "daemon off;"]
