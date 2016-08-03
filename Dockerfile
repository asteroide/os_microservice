FROM ubuntu:16.04

ARG KEYSTONE_PASSWD=password
ARG MYSQL_PASSWD=password

# Add Cloud repositories
#RUN apt-get install -qq -y software-properties-common
#RUN add-apt-repository cloud-archive:mitaka
#deb http://ubuntu-cloud.archive.canonical.com/ubuntu trusty-updates/mitaka main

RUN apt-get -qq -y update

#RUN apt-get -qq -y dist-upgrade
#RUN apt-get -qq -y install memcached

# install MySQL
RUN { \
                echo "mysql-server-5.5 mysql-server/root_password password $MYSQL_PASSWD"; \
                echo "mysql-server-5.5 mysql-server/root_password_again password $MYSQL_PASSWD"; \
                echo "mysql-server-5.5 mysql-server/root_password seen true"; \
                echo "mysql-server-5.5 mysql-server/root_password_again seen true"; \
        } | debconf-set-selections \
        && apt-get install -qq -y mysql-server python-mysqldb python-pymysql

#ADD scripts/configure_mysql.sh /tmp/configure_mysql.sh
#RUN bash /tmp/configure_mysql.sh

# install Apache
RUN apt-get install -qq -y apache2

# install RabbitMQ
#RUN apt-get install -qq -y rabbitmq-server
#RUN rabbitmqctl add_user openstack password
#RUN rabbitmqctl set_permissions openstack ".*" ".*" ".*"

# install OpenStack client
#RUN apt-get install -qq -y python-openstackclient

# install Keystone
#ADD conf/keystone_init.sql /tmp/keystone_init.sql
#RUN sed "s/PASSWORD/$KEYSTONE_PASSWD/" /tmp/keystone_init.sql > /tmp/keystone_init.sql.new
#RUN mysql -uroot -p$MYSQL_PASSWD < /tmp/keystone_init.sql.new

RUN apt-get install -qq -y keystone python-openstackclient libapache2-mod-wsgi



EXPOSE 5000 35357