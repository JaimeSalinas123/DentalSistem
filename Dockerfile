FROM php:8.2-apache

# 1. Instalar extensiones de base de datos necesarias para Laravel
RUN docker-php-ext-install pdo pdo_mysql

# 2. Configurar Apache para que apunte a la carpeta public de Laravel (CON 3 CEROS)
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf \
    && sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/apache2.conf

# 3. Copiar el código del proyecto al contenedor
COPY . /var/www/html

# 4. Habilitar mod_rewrite para el enrutamiento de Laravel
RUN a2enmod rewrite

# 5. Dar permisos correctos a las carpetas de almacenamiento
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80
