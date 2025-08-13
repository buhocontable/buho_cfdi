.PHONY: test build clean help

# Default target
help:
	@echo "Available targets:"
	@echo "  test    - Run the test suite in Docker"
	@echo "  build   - Build the Docker image"
	@echo "  clean   - Clean up Docker containers and volumes"
	@echo "  help    - Show this help message"

# Run tests in Docker
test:
	@echo "🚀 Running tests in Docker..."
	docker compose run --rm buho_cfdi
	@echo "✅ Tests completed!"

# Build the Docker image
build:
	@echo "🔨 Building Docker image..."
	docker compose build
	@echo "✅ Build completed!"

# Clean up Docker resources
clean:
	@echo "🧹 Cleaning up Docker resources..."
	docker compose down -v
	docker compose build --no-cache
	@echo "✅ Cleanup completed!"
