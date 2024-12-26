# Use a lightweight base image
FROM ubuntu:20.04

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    fortune \
    cowsay && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV PATH="/usr/games:${PATH}"

# Create app directory
WORKDIR /app

# Copy the application files
COPY wisecow.sh /app/
COPY quotes.txt /app/

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Set the entrypoint
ENTRYPOINT ["/app/wisecow.sh"]
