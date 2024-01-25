FROM jrl-base-dev-image:latest

ARG USERNAME

RUN sudo apt-get update && \
    DEBIAN_FRONTEND=noninteractive sudo apt install -y curl && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

RUN cd ~/ && \
    curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh && \
    sudo bash nodesource_setup.sh && \
    sudo apt install nodejs && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

# Install necessary tools for Vue web development - npm, vue, vuetify, etc.
# Example commands - modify as needed
RUN sudo npm install -g @vue/cli vuetify

# Other configurations and tools for Vue development if needed
# ...

# Set working directory for Vue development
WORKDIR /home/${USERNAME}/workspace
