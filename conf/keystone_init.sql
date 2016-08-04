CREATE DATABASE keystonedb DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
GRANT ALL ON keystonedb.* TO 'keystone'@'%' IDENTIFIED BY 'PASSWORD';
GRANT ALL ON keystonedb.* TO 'keystone'@'localhost' IDENTIFIED BY 'PASSWORD';