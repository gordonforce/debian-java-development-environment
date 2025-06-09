# Use the latest Debian stable (GA) version
FROM debian:stable

# Install zsh and other essential packages
# Use --no-install-recommends to reduce image size and avoid unnecessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    zsh \
    sudo \
    curl \
    wget \
    git \
    ansible \
    python3 \
    gnupg \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a test user with sudo privileges
RUN useradd -m -s /usr/bin/zsh testuser && \
    echo "testuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/testuser

# Create directory for the project
RUN mkdir -p /home/testuser/debian-java-development-environment
WORKDIR /home/testuser/debian-java-development-environment

# Copy the repository contents
COPY . .

# Make the scripts executable and fix ownership
RUN chmod +x src/main/zsh/install-dev-env.zsh && \
    chmod +x src/test/zsh/verify-dev-env-install.zsh && \
    chown -R testuser:testuser /home/testuser

# Switch to the test user
USER testuser

# Set the working directory
WORKDIR /home/testuser

# Command to run when the container starts - run the installation and verification scripts
# Save the verification results to files that can be accessed by the verify-with-test-container.zsh script
CMD ["zsh", "-c", "echo 'Running installation and verification...' && \
     ./debian-java-development-environment/src/main/zsh/install-dev-env.zsh && \
     ./debian-java-development-environment/src/test/zsh/verify-dev-env-install.zsh > /tmp/verification_result 2>&1; \
     echo $? > /tmp/verification_exit_code; \
     touch /tmp/verification_complete; \
     echo 'Verification complete. Container will now sleep to keep it running.'; \
     tail -f /dev/null"]
