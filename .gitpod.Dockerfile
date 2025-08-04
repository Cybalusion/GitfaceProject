FROM gitpod/workspace-full

USER root

RUN apt-get update && \
    apt-get install -y \
    xfce4 xfce4-goodies \
    x11vnc \
    xvfb \
    websockify \
    wget \
    curl \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/gitpod/.themes /home/gitpod/.icons && \
    git clone https://github.com/B00merang-Project/Windows-8.git /home/gitpod/.themes/Windows-8 && \
    git clone https://github.com/B00merang-Project/Windows-8-Icons.git /home/gitpod/.icons/Windows-8-Icons

USER gitpod
