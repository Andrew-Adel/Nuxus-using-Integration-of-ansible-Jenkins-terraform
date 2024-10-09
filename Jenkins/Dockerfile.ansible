# Base image: Python 3 on Debian
FROM python:3.9-slim


# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sshpass \
    openssh-client \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Ansible using pip
RUN pip install --upgrade pip && \
    pip install ansible

# Set up a working directory
WORKDIR /ansible

# Default command to run Ansible --version
CMD ["ansible", "--version"]