#!/usr/bin/env bash
set -e

# ======= CONFIGURATION =======
MYSQL_ROOT_PASSWORD="root#df3498349ju34j9803498j348"
MYSQL_DB_NAME="AURACNC"
MYSQL_APP_USER="AURACNC-USER"
MYSQL_APP_PASSWORD="AURA-CNC-SECURE-PASS"
# ==============================

echo "==============================="
echo "  AURA Setup Script (Ubuntu)"
echo "==============================="

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with root privileges:"
  echo "  sudo bash ./setup.sh"
  exit 1
fi

echo
echo "==> Updating system and requirements ..."
apt update && apt upgrade -y
apt install mysql-server -y
apt install screen -y
apt install apache2 -y

echo
echo "==> Enabling and starting MySQL service ..."
systemctl enable mysql.service
systemctl start mysql.service

echo
echo "==> Securing MySQL and setting root password (similar to mysql_secure_installation + ALTER USER) ..."
mysql -u root <<EOF
-- Set root password (as in your guide)
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '${MYSQL_ROOT_PASSWORD}';

-- Remove anonymous users
DELETE FROM mysql.user WHERE User='';

-- Remove test database
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

-- Reload privilege tables
FLUSH PRIVILEGES;
EOF

echo
echo "==> Creating database and application user ..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB_NAME}\`;
CREATE USER IF NOT EXISTS '${MYSQL_APP_USER}'@'localhost' IDENTIFIED BY '${MYSQL_APP_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_APP_USER}'@'localhost';
FLUSH PRIVILEGES;
EOF

echo
echo "==> Setting permissions in current directory: chmod 777 * ..."
chmod 777 *

echo
if [ -f "./AURA" ]; then
  echo "==> Found ./AURA – starting it in a screen session ..."
  echo "   To detach from screen: press Ctrl+A then D"
  screen ./AURA
else
  echo "Note: ./AURA was not found in the current directory."
  echo "You can start it later manually with:"
  echo "  screen ./AURA"
fi

echo
echo "All done!"
echo "Connect via SSH and check the file 'default_user.txt' on the server for the default login information."
