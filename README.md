# WordPress Docker Compose Setup

This repository contains a Docker Compose setup for running WordPress with MariaDB as the database. It allows you to easily deploy and manage your WordPress development environment.

## Prerequisites

Make sure you have the following dependencies installed on your system:

- Docker: [Installation Guide](https://docs.docker.com/get-docker/)
- Docker Compose: [Installation Guide](https://docs.docker.com/compose/install/)

## Getting Started

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/dimasmaulana/wordpress-docker-compose.git
   ```

2. Navigate to the project directory:

   ```bash
   cd wordpress-docker-compose
   ```

3. Create a copy of the .env.example file and name it .env:

   ```bash
   cp .env.example .env
   ```

   This command creates a new .env file by copying the contents of the .env.example file. The .env file is used to store environment-specific configurations and secrets.

4. Open the .env file in a text editor and provide the required configuration values. Update any placeholders or variables with the appropriate values for your environment.

5. Customize the configuration:

   - Open the `docker-compose.yml` file in a text editor.
   - Modify the environment variables according to your needs.
   - Optionally, set the values for `HTTP_PORT` and `HTTPS_PORT` to expose the respective ports. If not set, the ports will remain closed.

6. Start the containers:

   ```bash
   docker-compose up -d
   ```

   This command will start the WordPress and MariaDB containers in detached mode.

7. Access WordPress in your browser:

   Open your web browser and visit `http://localhost:${HTTP_PORT}` or `https://localhost:${HTTPS_PORT}` (if specified) to access your WordPress site.

8. Stop the containers:

   ```bash
   docker-compose down
   ```

   This command will stop and remove the containers.

To execute a WP-CLI command, run the following command:

```bash
./bin/wpcli.sh <command>
```

For example, to list installed plugins, run:

```bash
./bin/wpcli.sh plugin list
```

Make sure to replace <command> with the desired WP-CLI command.

The ./bin/wpcli.sh script handles the Docker Compose invocation internally, so you don't need to remember or type the full Docker Compose command each time you want to use WP-CLI.

## Site URL Replacement Script

The repository includes a shell script `./bin/site-url-replace.sh` that simplifies the process of replacing the site URL in your WordPress installation. This script utilizes WP-CLI to perform the search and replace operation.

To use the script, follow these steps:

1. Make sure the `site-url-replace.sh` script is present in the `./bin/` directory relative to the `docker-compose.yml` file.

2. Make the script executable by running the following command:

   ```bash
   chmod +x ./bin/site-url-replace.sh
   ```

3. Execute the script with the desired arguments. The script expects one argument, which is the new site URL to replace the existing URL with. For example:

   ```bash
   ./bin/site-url-replace.sh new-site-url
   ```

   Replace `new-site-url` with the actual URL you want to use.

   **Note:** Before running the script, make sure you have started the WordPress and MariaDB containers using `docker-compose up -d`.

4. The script will activate maintenance mode on your WordPress site, perform the search and replace operation, and then deactivate maintenance mode.

   The script uses WP-CLI to retrieve the current site URL and then replaces it with the provided new URL. It ensures that the search and replace operation is performed safely within the database.

   Please note that this script assumes you have WP-CLI installed in the `wpcli` service container specified in the `docker-compose.yml` file.

5. After running the script, verify that the site URL has been updated to the new value.

Feel free to modify the `site-url-replace.sh` script as needed to accommodate any specific requirements or additional functionality you may require.

## License

This project is licensed under the [MIT License](LICENSE).
