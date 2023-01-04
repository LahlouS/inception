#!bin/bash
sleep 10
cd /var/www/wordpress
wp core download --allow-root --locale=fr_FR
wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/wordpress'
wp core install --allow-root --url=https://slahlou.42.fr --title="Inception" --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL}
wp user create --allow-root ${WORDPRESS_USER_2} ${WORDPRESS_USER_2_EMAIL} --role=author --user_pass=${WORDPRESS_USER_2_MDP}
wp cache flush --allow-root
wp theme install wpkites --activate --allow-root
mkdir /run/php
exec /usr/sbin/php-fpm7.3 -F -R
