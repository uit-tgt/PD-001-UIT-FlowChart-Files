# Các biến
COMPOSE_FILE=docker-compose.yml
FRONTEND_REPO_URL=https://github.com/uit-tgt/PD-001-UIT-FlowChart-FE.git
BACKEND_REPO_URL=https://github.com/uit-tgt/PD-001-UIT-FlowChart-BE.git
DOCKER_REPO_URL=https://github.com/uit-tgt/PD-001-UIT-FlowChart-DO.git

.PHONY: compose-build
compose-build:
	docker compose -f $(COMPOSE_FILE) build

.PHONY: compose-up
compose-up:
	docker compose -f $(COMPOSE_FILE) up -d

.PHONY: compose-up-build
compose-up-build:
	docker compose -f $(COMPOSE_FILE) up --build -d

.PHONY: compose-down
compose-down:
	docker compose -f $(COMPOSE_FILE) down

.PHONY: clone-and-install
clone-and-install:
	git clone $(FRONTEND_REPO_URL) frontend && cd frontend && npm install
	git clone $(BACKEND_REPO_URL) backend && cd backend && npm install
	git clone $(DOCKER_REPO_URL) docker && cd docker && npm install

.PHONY: pull-code
pull-code:
	git -C frontend pull origin main
	git -C backend pull origin main
	git -C docker pull origin main
	$(MAKE) compose-up-build
