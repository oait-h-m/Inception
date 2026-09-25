#!/bin/bash
set -e

if [ ! -f "/etc/vsftpd.userlist" ]; then
    echo "Configuring FTP user..."
    mkdir -p /var/run/vsftpd/empty
    
    # Create user with /var/www/html as home directory
    useradd -m -s /bin/bash -d /var/www/html ${FTP_USER}
    echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd
    
    # Add user to vsftpd allowed list
    echo "${FTP_USER}" > /etc/vsftpd.userlist
fi

# ALWAYS force ownership when the container boots so WordPress doesn't lock us out
echo "Setting directory permissions..."
chown -R ${FTP_USER}:${FTP_USER} /var/www/html

echo "Starting vsftpd..."
exec vsftpd /etc/vsftpd.conf