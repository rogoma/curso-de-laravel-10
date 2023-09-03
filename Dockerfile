FROM php:8.1-fpm

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpq-dev \
    libpng-dev \
    libonig-dev \
    libmcrypt-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_pgsql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Set working directory
WORKDIR /var/www

# # Copy custom configurations PHP
COPY docker/php/custom.ini /usr/local/etc/php/conf.d/custom.ini

USER $user


# FROM php:8.1-fpm

# # set your user name, ex: user=bernardo
# ARG user=carlos
# ARG uid=1000

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     git \
#     curl \
#     libpq-dev \
#     libpng-dev \
#     libonig-dev \
#     libmcrypt-dev \
#     libxml2-dev \
#     zip \
#     unzip

# # Clear cache
# RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# # Install PHP extensions MYSQL
# #RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd sockets

# # Install PHP extensions PGSQL
# RUN docker-php-ext-install pdo_pgsql mbstring exif pcntl bcmath gd

# # Get latest Composer
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# # Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u $uid -d /home/$user $user
# RUN mkdir -p /home/$user/.composer && \
#     chown -R $user:$user /home/$user

# # Install redis original NO FUNCIONA
# # RUN pecl install -o -f redis \
# #     &&  rm -rf /tmp/pear \
# #     &&  docker-php-ext-enable redis

# #ESTO FUNCIONA: https://github.com/docker-library/php/issues/1118
# RUN mkdir -p /usr/src/php/ext/redis; \
# 	curl -fsSL https://pecl.php.net/get/redis --ipv4 | tar xvz -C "/usr/src/php/ext/redis" --strip 1; \
# 	docker-php-ext-install redis;

# # Set working directory
# WORKDIR /var/www

# # Copy custom configurations PHP
# COPY docker/php/custom.ini /usr/local/etc/php/conf.d/custom.ini

# USER $user


