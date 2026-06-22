FROM wordpress:latest

# 1. Aplicamos el parche de Apache durante la construcción de la imagen
RUN a2dismod mpm_event mpm_worker || true \
    && a2enmod mpm_prefork || true

# 2. Copiamos tu carpeta con tus temas y plugins
COPY ./wp-content /var/www/html/wp-content

# 3. Le damos permisos a WordPress para que pueda leer y escribir en tus archivos
RUN chown -R www-data:www-data /var/www/html/wp-content
