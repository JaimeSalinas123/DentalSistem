FROM php:8.4-apache

# 1. Instalar utilidades del sistema y extensiones de base de datos
RUN apt-get update && apt-get install -y unzip git \
    && docker-php-ext-install pdo pdo_mysql

# 2. Instalar Composer oficial
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 3. Configurar Apache para apuntar a la carpeta public de Laravel
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf \
    && sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/apache2.conf

# 4. Copiar el código del proyecto al contenedor
COPY . /var/www/html

# 5. Instalar las dependencias limpias para Linux
RUN rm -rf /var/www/html/vendor \
    && composer install --no-dev --optimize-autoloader --no-scripts

# 6. Habilitar mod_rewrite para las rutas de Laravel
RUN a2enmod rewrite

# 7. Garantizar permisos absolutos al usuario de Apache (www-data) sobre todo el proyecto
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80

# 8. Ejecutar optimización y migraciones al arrancar, luego encender Apache en primer plano
CMD php artisan config:clear && php artisan migrate --force && apache2-foreground
