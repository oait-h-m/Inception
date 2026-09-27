# User Documentation (USER_DOC.md)

Welcome to the Inception project infrastructure. This document explains how to use, manage, and access the services provided by this stack.

## 1. Services Provided by the Stack
This infrastructure runs a complete, containerized web environment featuring a primary WordPress website and several administrative/bonus services:
*   **WordPress (Website):** The main content management system where the website is built and hosted.
*   **MariaDB (Database):** The secure backend database storing all WordPress users, posts, and settings.
*   **NGINX (Web Server):** The secure gateway that handles incoming traffic and encrypts it via HTTPS (TLS).
*   **Redis (Cache):** A high-speed memory cache that makes the WordPress site load significantly faster.
*   **FTP Server:** A file transfer portal allowing you to upload files (like themes or plugins) directly to the web server.
*   **Static Site / CV:** A secondary, standalone website serving a static portfolio/CV via Node.js.
*   **Adminer:** A visual database management dashboard accessible from your browser.
*   **Portainer:** A visual dashboard for monitoring and managing the server infrastructure itself.

## 2. Starting and Stopping the Project
The entire infrastructure is automated via a standard `Makefile` at the root of the repository.

*   **To start the project:** Open a terminal in the root directory and run:
    ```bash
    make
    ```
    This will build and launch all services in the background.
    
*   **To stop the project:** When you are done, shut down the infrastructure safely by running:
    ```bash
    make down
    ```

## 3. Accessing the Websites and Administration Panels
Once the project is running, you can access the various services using a web browser:

*   **Main WordPress Site:** [https://oait-h-m.42.fr](https://oait-h-m.42.fr) 
*   **WordPress Admin Panel:** [https://oait-h-m.42.fr/wp-admin](https://oait-h-m.42.fr/wp-admin)
*   **Static Site / CV:** [http://localhost:3000](http://localhost:3000)
*   **Adminer (Database GUI):** [http://localhost:8080](http://localhost:8080)
*   **Portainer (Server GUI):** [http://localhost:9000](http://localhost:9000)
*   **FTP Server:** Access via an FTP client (like FileZilla) at `localhost` on port `21` using Passive Mode.

## 4. Locating and Managing Credentials
All passwords, database users, and administrative credentials are centrally managed in a hidden environment file. 
*   **Location:** The file is located at `srcs/.env`.
*   **Management:** To change passwords for WordPress, the Database, or the FTP server, simply open the `.env` file in a text editor, update the values, and restart the project using `make down` followed by `make`. 

## 5. Checking that Services are Running Correctly
To verify the health of the system:
1.  **Visual Check:** Open **Portainer** at `http://localhost:9000` and view the "Containers" tab. All 8 containers should have a green "running" status.
2.  **Terminal Check:** Run `docker ps` in your terminal to see a list of active services and their health status.
