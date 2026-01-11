# Aura-CNC V1.9
A CNC made by me

# Setupguide
requirements:
A VPS
OS: Ubuntu 24.04
A brain!

# firs step put all the files on the server 


# Run theas 4 commands line by line:

sudo apt update && apt upgrade -y
sudo apt install mysql-server -y
sudo systemctl start mysql.service
mysql_secure_installation



# Run theas 3 commands line by line:

sudo mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root#1234567890'; 
exit



# Run These 5 Commands below:

mysql -u root -proot#1234567890
CREATE DATABASE `AURA1`;
CREATE USER 'AURACNC1'@'localhost' IDENTIFIED BY 'AURACNCSECUREPASS';
GRANT ALL PRIVILEGES ON * . * TO 'AURACNC1'@'localhost';
FLUSH PRIVILEGES;
exit




# Extra Help :
Run These Commands Below

apt install screen

chmod 777 *
sudo screen ./AURA

Connect Using "SSH"

Make Sure To Look at Your Default Login... It Will Be in (default_user.txt) file on the server!
