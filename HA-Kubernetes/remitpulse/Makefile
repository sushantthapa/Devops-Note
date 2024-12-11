.PHONY: all clean

# Default target
all: stop build up logs

run: build up logs


# Clean up docker containers and prune system
stop:
	docker compose down
# 	yes | docker system prune -a

# Build the project
build:
	mvn clean install

# Bring up containers using docker-compose
up:
	docker compose up -d --build

# Follow logs of the remit-core service
logs:
	docker logs -f remit-third-party

