FROM php:8.4-apache

# 1. Instalar utilidades, extensiones de BD y Node.js (NPM) para compilar el frontend
RUN apt-get update && apt-get install -y unzip git curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && docker-php-ext-install pdo pdo_mysql

# 2. Instalar Composer oficial
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 3. Configurar Apache
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf \
    && sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/apache2.conf

# 4. Copiar el código del proyecto
COPY . /var/www/html

# 5. Instalar dependencias Backend y compilar JavaScript/CSS (Frontend)
RUN rm -rf /var/www/html/vendor /var/www/html/node_modules \
    && composer install --no-dev --optimize-autoloader --no-scripts \
    && npm install \
    && npm run build

# 6. Habilitar mod_rewrite
RUN a2enmod rewrite

# 7. Permisos correctos
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80

# 8. Arrancar
CMD php artisan config:clear && apache2-foreground
