FROM wordpress:latest
COPY ./wp-content /var/www/html/wp-content
CMD ["bash", "-c", "a2dismod mpm_event mpm_worker 2>/dev/null || true; a2enmod mpm_prefork 2>/dev/null || true; apache2-foreground"]
