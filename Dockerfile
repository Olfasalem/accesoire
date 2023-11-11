# Utilisez une image officielle d'nginx en tant qu'image de base
FROM nginx

# Copiez les fichiers HTML, CSS, jQuery, et Bootstrap dans le répertoire /usr/share/nginx/html de l'image
COPY . /usr/share/nginx/html

# Exposez le port 80 pour le trafic HTTP
EXPOSE 80
