FROM p_base_image:latest

RUN apt-get update && apt-get dist-upgrade -y --no-install-recommends
RUN apt-get -y --no-install-recommends install \
    libc6-dev \
    libgtk2.0-0 \
    libgtk-3-0 \
    libpango-1.0-0 \
    libcairo2 \
    libfontconfig1 \
    libgconf-2-4 \
    libnss3 \
    libasound2 \
    libxtst6 \
    unzip \
    libglib2.0-bin \
    libcanberra-gtk-module \
    libgl1-mesa-glx \
    gettext \
    libstdc++6 \
    xterm \
    automake \
    libtool \
    autogen \
    nodejs \
    libnotify-bin \
    aspell \
    aspell-en \
    htop \
    emacs25 \
    mono-complete \
    gvfs-bin \
    libxss1 \
    rxvt-unicode-256color \
    x11-xserver-utils \
    libxkbfile1


ENV NODE_VERSION=10.15.0 \
    NPM_VERSION=6.4.1 \
    DISTRO=linux-x64

# update npm
RUN curl --retry 3 -SLO "http://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-${DISTRO}.tar.gz" && \
    tar -xzf "node-v${NODE_VERSION}-${DISTRO}.tar.gz" -C /usr/local --strip-components=1 && \
    rm "node-v${NODE_VERSION}-${DISTRO}.tar.gz" && \
    npm install -g -f npm@${NPM_VERSION}

# download vscode 
RUN wget -O vscode-amd64.deb https://go.microsoft.com/fwlink/?LinkID=760868
RUN gdebi -n vscode-amd64.deb
RUN rm vscode-amd64.deb

# enable sudo for developer
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user

# add user settings
ADD ./volume/settings/settings.json /home/user/.config/Code/User/settings.json
RUN chown -R user:user /home/user/.config/

# change user
USER user

# install vscode extensiond
RUN code --install-extension ms-python.python

WORKDIR /home/user/volume/

# entrypoint
CMD code . && tail -f /dev/null
