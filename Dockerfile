FROM ubuntu:22.04

# Install necessary tools - build-essential, python3, git
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y sudo build-essential python3 git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up a non-root user with UID and GID from the .env file
ARG USERNAME
ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

# Set up workspace directory and .ssh directory
WORKDIR /home/$USERNAME/workspace
RUN mkdir -p /home/$USERNAME/.ssh && chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set Docker user as non-root user
USER $USERNAME

# Set working directory
WORKDIR /home/$USERNAME/workspace

# Entry point
CMD ["bash"]
