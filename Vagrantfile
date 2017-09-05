Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/xenial64"

    # Shared ports
    config.vm.network "forwarded_port", host:8888, guest: 80
    # config.vm.network "forwarded_port", host:3307, guest: 3306

    # Mount shared folder using NFS
    # config.vm.synced_folder ".", "/vagrant",
    #     id: "core",
    #     :nfs => true,
    #     :mount_options => ['nolock,vers=3,udp,noatime']

    # Do some network configuration
    # config.vm.network "private_network", ip: "192.168.98.13"

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 1024]
        vb.customize ["modifyvm", :id, "--cpus", 2]
    end

    # Prevents "stdin: is not a tty" on Ubuntu (https://github.com/mitchellh/vagrant/issues/1673)
    config.vm.provision "fix-no-tty", type: "shell" do |s|
        s.privileged = false
        s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
    end

    # install system packages as root user
    config.vm.provision 'shell', privileged: true, inline: <<SHELL

###############################################################################
echo "========== Update packages =========="
export DEBIAN_FRONTEND=noninteractive
apt-get install -qq software-properties-common &> /dev/null || exit 1
apt-get -y update

###############################################################################
echo "========== Installing baseline bits =========="
apt-get -q -y install vim autojump

echo "========== Installing Packages =========="
apt-get -q  -y install mysql-server mysql-client
apt-get -q  -y install apache2
apt-get -q  -y install php7.0 mcrypt php7.0-mcrypt php-mbstring php-pear php7.0-dev php7.0-xml libapache2-mod-php7.0
apt-get -q  -y install php7.0-opcache php7.0-cli php7.0-curl php7.0-mysql
apt-get -q  -y install php-xdebug
apt-get -q  -y install re2c gcc g++


echo "========== Configure PHP =========="
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.0/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.0/apache2/php.ini
sed -i "s/html_errors = .*/html_errors = On/" /etc/php/7.0/apache2/php.ini
sed -i "s/;date.timezone =.*/date.timezone = \\\"Europe\\/London\\\"/" /etc/php/7.0/apache2/php.ini

sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.0/cli/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.0/cli/php.ini
sed -i "s/html_errors = .*/html_errors = Off/" /etc/php/7.0/cli/php.ini
sed -i "s/;date.timezone =.*/date.timezone = \\\"Europe\\/London\\\"/" /etc/php/7.0/cli/php.ini

if [ $(grep -c "overload_var_dump" /etc/php/7.0/mods-available/xdebug.ini) -eq 0 ]; then
    cat <<- 'EOF' >> /etc/php/7.0/mods-available/xdebug.ini

xdebug.overload_var_dump        = 2
xdebug.scream                   = 0
xdebug.max_nesting_level        = 1000
xdebug.var_display_max_children = -1
xdebug.var_display_max_data     = -1
xdebug.var_display_max_depth    = 10
xdebug.collect_params           = 0
xdebug.halt_level               = E_WARNING|E_NOTICE|E_USER_WARNING|E_USER_NOTICE
xdebug.remote_enable            = on
xdebug.remote_connect_back      = on
xdebug.profiler_enable_trigger  = off
xdebug.remote_host              = 127.0.0.1

EOF
fi


echo "========== Configure Apache =========="
a2enmod rewrite

# Need to tell Apache to use the varant user so that it can access /vagrant
sed -i "s/APACHE_RUN_USER=.*/APACHE_RUN_USER=ubuntu/" /etc/apache2/envvars
sed -i "s/APACHE_RUN_GROUP=.*/APACHE_RUN_GROUP=ubuntu/" /etc/apache2/envvars

echo "========== Update VirtualHost =========="
sed -i "s/DocumentRoot .*/DocumentRoot \\/vagrant\\/public/" /etc/apache2/sites-available/000-default.conf
sed -i 's/<\\/VirtualHost>/    <Directory "\\/vagrant\\/public">\\
        Options Indexes FollowSymLinks MultiViews\\
        AllowOverride None\\
        Order allow,deny\\
        Allow from all\\
        Require all granted\\
        \\
        RewriteEngine On\\
        RewriteBase \\/\\
        RewriteCond %{REQUEST_FILENAME} -s [OR]\\
        RewriteCond %{REQUEST_FILENAME} -l [OR]\\
        RewriteCond %{REQUEST_FILENAME} -d\\
        RewriteRule ^.*$ - [NC,L]\\
        RewriteRule ^.*$ index.php [NC,L]\\
    <\\/Directory>\\
<\\/VirtualHost>/' /etc/apache2/sites-available/000-default.conf

echo "========== Restart Apache =========="
service apache2 restart



echo "========== Configure Mysql =========="
mysql -u root -e "CREATE DATABASE bookshelf CHARACTER SET utf8 COLLATE utf8_general_ci";
mysql -u root -e "CREATE USER bookshelf@'%' IDENTIFIED BY 'bookshelf'";
mysql -u root -e "GRANT ALL PRIVILEGES ON bookshelf.* TO 'bookshelf'@'%'"
if [ -e /vagrant/data/seed-mysql.sql ]; then
mysql -u root bookshelf < /vagrant/data/seed-mysql.sql
fi

# Allow anyone to connect to MySQL - don't do this in production!
sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql restart

SHELL

  # items for vagrant user
  config.vm.provision 'shell', privileged: false, inline: <<SHELL

###############################################################################
# Add autojump and history search to bashrc
if [ $(grep -c "autojump" .bashrc) -eq 0 ]; then
    cat <<- 'EOF' >> .bashrc

# Enable autojump
source /usr/share/autojump/autojump.bash

# Map up & down to history search once a command has been started.
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

EOF

    source .bashrc
fi

echo ""
echo "Done"
SHELL
end
