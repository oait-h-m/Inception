# Developer Documentation (DEV_DOC.md)

This document provides technical instructions for developers and evaluators to deploy, debug, and understand the architectural choices of this Inception infrastructure.

## 1. Setting Up the Environment from Scratch

### Prerequisites
*   **OS:** A Debian-based Linux Virtual Machine (Debian Bookworm/Bullseye).
*   **Dependencies:** Docker Engine, Docker Compose plugin, and `make`.
*   **Domain Resolution:** You must route the project domain to your local machine. Edit `/etc/hosts` and add the following line:
    ```text
    127.0.0.1   oait-h-m.42.fr
    ```
*   **Host Directories:** The system requires specific folders on the host machine to bind-mount persistent data. Run:
    ```bash
    mkdir -p /home/oait-h-m/data/mariadb
    mkdir -p /home/oait-h-m/data/wordpress
    mkdir -p /home/oait-h-m/data/portainer
    ```

### Configuration and Secrets
The infrastructure relies on environment variables for security. You must create a `.env` file inside the `srcs/` directory before building. It must contain the following keys:
```env
# Database Credentials
SQL_DATABASE=wordpress
SQL_USER=your_db_user
SQL_PASSWORD=your_db_password
SQL_ROOT_PASSWORD=your_root_password

# WordPress Credentials
WP_ADMIN_USER=your_admin_user
WP_ADMIN_PASSWORD=your_admin_password
WP_ADMIN_EMAIL=admin@example.com
WP_USER=your_standard_user
WP_USER_PASSWORD=your_standard_password
WP_USER_EMAIL=user@example.com

# FTP Credentials
FTP_USER=your_ftp_user
FTP_PASSWORD=your_ftp_password
