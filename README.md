*This project has been created as part of the 42 curriculum by Oussama AIT H'MAD.*
Title: # Inception
Section 1: ## Description
Subsection: ### Use of Docker and Included Sources
Subsection: ### Main Design Choices
Subsection: ### Architectural Comparisons (Virtual Machines vs Docker, Secrets vs Environment Variables, Docker Network vs Host Network, Docker Volumes vs Bind Mounts)
Section 2: ## Instructions (Prerequisites, Execution)
Section 3: ## Resources (Classic references, Use of AI).

Refine the Text for Final Output:
Ensure no additional commentary is provided outside the code block if it compromises the formatting (I'll just present the markdown block clearly). I will provide the raw markdown in a standard code block format so they can copy it cleanly.

Self-Correction on length/conciseness constraint: The user asked for "README in md format". This falls under the "Professional Business & Workplace" or "Factual, Academic & Technical Queries" routing. A complete, uncompressed copyable artifact is required. Never truncate professional deliverables to hit a conciseness target.

Step 5 Compliance Check: No forbidden phrases used. No sensitive data. Provided direct answer. Included all requirements for the 42 Inception README. No unprompted personalization except the already established username Oussama AIT H'MAD.

Drafting the Markdown: (Proceeding to generate the exact markdown block)```markdown
This project has been created as part of the 42 curriculum by Oussama AIT H'MAD.

Inception
Description
The goal of the Inception project is to broaden your knowledge of system administration by using Docker. This project requires deploying a complete, multi-service infrastructure (a LEMP stack) acting as a unified web platform, all managed via Docker Compose.

Unlike traditional setups where all services run on a single machine, this infrastructure relies entirely on containerization. Every service (NGINX, WordPress, MariaDB) runs in its own dedicated, isolated environment. To fulfill the bonus requirements, this stack also includes a Redis cache, an FTP server, a Node.js Static Site (portfolio), Adminer for database management, and Portainer for container monitoring.

Use of Docker and Included Sources
Docker is utilized to isolate dependencies, ensuring that the web server, application logic, and database do not interfere with one another. All containers in this project are built from custom Dockerfiles utilizing Debian Bookworm as the base image. The source files include custom configuration scripts (nginx.conf, wp-config.php) and entrypoint shell scripts that dynamically construct the services upon boot using environment variables.

Main Design Choices
PID 1 Management: All core processes (e.g., nginx -g daemon off;, php-fpm -F) are run in the foreground to ensure they run as Process ID 1, preventing the containers from exiting.

Decentralization: No two services share a container. NGINX strictly handles TLS termination and reverse proxying, while PHP processing is offloaded entirely to the WordPress container via FastCGI.

Security: The network is completely sealed off from the outside world. Only NGINX (HTTPS port 443), the FTP data channels, Portainer, and the Static Site are exposed to the host machine. Internal services like MariaDB and Redis are shielded within the Docker network.

Architectural Comparisons
Virtual Machines vs Docker

Virtual Machines: Virtualize the physical hardware. Each VM requires a complete, independent guest Operating System (kernel + libraries), making them highly isolated but resource-heavy and slow to boot.

Docker: Virtualizes the Operating System layer. Containers share the host machine's Linux kernel and use namespaces/cgroups for isolation. This makes Docker containers exceptionally lightweight, allowing dozens of them to run efficiently on a single host.

Secrets vs Environment Variables

Environment Variables: Injected into the container's environment during startup (often via a .env file). They are easy to implement and use, but less secure because they can be exposed by running commands like docker inspect.

Docker Secrets: A native swarm feature where sensitive data is encrypted, stored securely, and mounted dynamically into the container's file system (often in memory via tmpfs). This is much more secure for production but more complex to orchestrate.

Docker Network vs Host Network

Docker Network (Bridge): Creates an isolated virtual subnet. Containers can communicate with each other using automatic internal DNS (e.g., WordPress pinging mariadb), but external traffic cannot reach them unless specific ports are explicitly mapped.

Host Network: Removes network isolation entirely. The container uses the host machine's exact network stack, meaning if a container opens port 80, it opens port 80 directly on the host. It is faster but poses a massive security risk.

Docker Volumes vs Bind Mounts

Docker Volumes: Storage managed entirely by Docker (usually stored in /var/lib/docker/volumes/). The exact physical location is abstracted away from the user. They are easier to back up and manage across different operating systems.

Bind Mounts: Maps a specific, hardcoded path on the host machine directly into the container (e.g., /home/oait-h-m/data/mariadb). While it rigidly ties the container to the host's directory structure, it allows developers direct access to the files from the host OS, which is the method used in this infrastructure for data persistence.

Instructions
Prerequisites
Ensure Docker Engine and make are installed.

Ensure the local domain name is routed to your localhost. Add the following to your /etc/hosts file:

Plaintext
127.0.0.1   oait-h-m.42.fr
Ensure the required host directories exist for the bind mounts:

Bash
mkdir -p /home/oait-h-m/data/mariadb
mkdir -p /home/oait-h-m/data/wordpress
mkdir -p /home/oait-h-m/data/portainer
Create a .env file inside the srcs/ directory containing the necessary database, WordPress, and FTP credentials.

Execution
The entire infrastructure is automated via a Makefile located at the root of the repository.

Build and Start: Navigate to the root directory and run:

Bash
make
This command will build the custom images and launch all containers in the background.

Stop Services:

Bash
make down
Complete Teardown (fclean):
To simulate a completely fresh deployment, use the factory reset rule:

Bash
make fclean
Warning: This stops all containers, prunes the Docker system cache, and permanently wipes the data inside /home/oait-h-m/data/.

Resources
Classic References
Docker Documentation: https://docs.docker.com/ (Compose file references, Dockerfile instructions, network architecture).

NGINX Documentation: https://nginx.org/en/docs/ (TLS termination, FastCGI configuration, server blocks).

MariaDB Knowledge Base: https://mariadb.com/kb/en/ (User creation, privileges, and database initialization).

WordPress Developer Resources: https://developer.wordpress.org/cli/commands/ (WP-CLI automation for non-interactive installation).

Use of Artificial Intelligence
Artificial Intelligence (Large Language Models) was used during the development of this project as a thought partner and debugging tool in the following ways:

Architectural Clarification: AI was used to understand the low-level kernel mechanics of bind mounts versus volumes, and how Docker's internal DNS routing functions across a custom bridge network.

Debugging Configuration: AI assisted in diagnosing and resolving a race condition between the MariaDB startup and the WordPress boot sequence, leading to the implementation of healthchecks in the docker-compose.yml.

Documentation Formatting: AI was used to generate the boilerplate Markdown structures for USER_DOC.md, DEV_DOC.md, and this README.md to ensure they strictly adhered to the 42 evaluation subject rubrics. AI also verified that the NGINX SSL configuration accurately restricted HTTP access to comply with project security rules.
