.DEFAULT_GOAL := help
.PHONY: *

help:
	@echo "\033[33mUsage:\033[0m\n  make [target] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build Docker image
	docker build --pull --no-cache --tag petk/phpcs --file Dockerfile .

test: ## Run all tests; Usage: make test [t="<test-folder-1> <test-folder-2> ..."]
	@cd tests; \
	./test "$(t)"
