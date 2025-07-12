#!/usr/bin/env zsh

# Script to verify the installation script using a Docker container
# This script creates a Docker container with the latest Debian version,
# executes the verify-dev-env-install.zsh script, and reports the results

echo "Starting verification of installation script using a Docker container..."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
  echo "Error: Docker is not installed. Please install Docker first."
  exit 1
fi

# Get the repository root directory
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
if [[ -z "$REPO_ROOT" ]]; then
  REPO_ROOT=$(pwd)
fi

# Build the Docker image
echo "Building Docker image..."
CONTAINER_NAME="debian-java-dev-env-test-$(date +%s)"
docker build -t debian-java-dev-env-test -f "$REPO_ROOT/src/test/zsh/Dockerfile" "$REPO_ROOT"

# Run the container
echo "Running container..."
docker run --name "$CONTAINER_NAME" -d debian-java-dev-env-test

# Wait for the container to be fully started
sleep 2

# Follow the container logs to see the installation and verification process
echo "Following container logs (press Ctrl+C to stop following logs)..."
docker logs -f "$CONTAINER_NAME" &
LOGS_PID=$!

# Wait for the installation and verification to complete
echo "Waiting for installation and verification to complete..."
while docker ps -q --filter "name=$CONTAINER_NAME" &>/dev/null; do
  # Check if the verification script has completed
  if docker exec "$CONTAINER_NAME" test -f /tmp/verification_complete; then
    break
  fi
  sleep 5
done

# Stop following logs
kill $LOGS_PID 2>/dev/null

# Get verification result
echo "Getting verification results..."
VERIFICATION_RESULT=$(docker exec "$CONTAINER_NAME" cat /tmp/verification_result 2>/dev/null)
VERIFICATION_EXIT_CODE=$(docker exec "$CONTAINER_NAME" cat /tmp/verification_exit_code 2>/dev/null)

# Display verification results
echo "\nVerification Results:"
echo "$VERIFICATION_RESULT"

# Clean up the container
echo "\nCleaning up container..."
docker stop "$CONTAINER_NAME" > /dev/null
docker rm "$CONTAINER_NAME" > /dev/null

# Report final status
if [[ $VERIFICATION_EXIT_CODE -eq 0 ]]; then
  echo "\n✅ Verification successful: The installation script works correctly!"
  exit 0
else
  echo "\n❌ Verification failed: The installation script has issues."
  exit 1
fi
