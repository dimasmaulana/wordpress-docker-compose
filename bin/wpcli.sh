#!/bin/bash

# Run WP CLI command using Docker Compose
docker-compose run --rm wpcli wp "$@"
