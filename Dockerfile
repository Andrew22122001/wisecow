# Use a lightweight base image
FROM debian:latest

# Set the working directory inside the container
WORKDIR /app

# Copy all application files into the container
COPY . .

# Install necessary packages
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune \
    netcat-openbsd && \
    apt-get clean

# Make the script executable
RUN chmod +x wisecow.sh

# Set the script to run on container start
CMD ["bash", "wisecow.sh"]
