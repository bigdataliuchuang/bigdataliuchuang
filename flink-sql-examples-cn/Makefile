COMPOSE ?= docker compose

.PHONY: help up down restart ps logs sql-client

help:
	@echo "Available targets:"
	@echo "  make up          Start local Flink + Kafka demo environment"
	@echo "  make down        Stop local demo environment"
	@echo "  make restart     Restart local demo environment"
	@echo "  make ps          Show running containers"
	@echo "  make logs        Tail service logs"
	@echo "  make sql-client  Open Flink SQL Client"

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

restart: down up

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs -f

sql-client:
	docker exec -it flink-sql-client /opt/flink/bin/sql-client.sh
