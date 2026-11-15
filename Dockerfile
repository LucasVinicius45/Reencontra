
FROM nginxinc/nginx-unprivileged:stable-alpine

# Copia somente os arquivos do site
COPY --chown=101:101 app/ /usr/share/nginx/html/

EXPOSE 8080

USER 101

CMD ["nginx", "-g", "daemon off;"]