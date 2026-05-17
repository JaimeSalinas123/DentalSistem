FROM php:8.2-apache

# Instalar extensiones de base de datos
RUN docker-php-ext-install pdo pdo_mysql

# Cambiar la raíz del documento de Apache a la carpeta public de Laravel
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/0000-default.conf \
    && sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/apache2.conf

# Copiar el código del proyecto
COPY . /var/www/html

# Dar permisos correctos a carpetas de Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Habilitar mod_rewrite de Apache para las rutas de Laravel
RUN a2enmod rewrite

EXPOSE 80
