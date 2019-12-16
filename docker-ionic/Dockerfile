FROM base_image:latest
# https://hub.docker.com/r/marcoturi/ionic/dockerfile/
# https://ionicframework.com/docs/intro/installation/
# https://hub.docker.com/r/agileek/ionic-framework/dockerfile
# https://github.com/mswag/docker-ionic

ENV DEBIAN_FRONTEND=noninteractive \
	ANDROID_HOME=/opt/android-sdk-linux \
	NODE_VERSION=10.15.0 \
	NPM_VERSION=6.4.1 \
	IONIC_VERSION=4.5.0 \
	TYPESCRIPT_VERSION=2.6.2 \
	CORDOVA_VERSION=8.1.2 \
	GRADLE_VERSION=4.1 \
	YARN_VERSION=1.12.3 \
	DISTRO=linux-x64 \
	BUILDTOOLS_VERSION=26.0.2 \
	PLATFORM_VERSION=android-27 \
	SDK_TOOLS=linux-4333796


# install python software-properties and fonts
RUN apt-get update && apt-get install -y --no-install-recommends \
	python \
	fonts-ipafont-gothic \
	xfonts-100dpi \
	xfonts-75dpi \
	xfonts-cyrillic \
	xfonts-scalable \
	libfreetype6 \
	libfontconfig

RUN curl --retry 3 -SLO "http://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-${DISTRO}.tar.gz" && \
	tar -xzf "node-v${NODE_VERSION}-${DISTRO}.tar.gz" -C /usr/local --strip-components=1 && \
	rm "node-v${NODE_VERSION}-${DISTRO}.tar.gz" && \
	npm install -g -f npm@${NPM_VERSION} && \
	npm install -g cordova@${CORDOVA_VERSION} \
	ionic@${IONIC_VERSION} \
	yarn@${YARN_VERSION} \
	typescript@${TYPESCRIPT_VERSION}
RUN npm install -g node-gyp sass

RUN npm cache clear --force

# this is necessary for ionic commands to run
RUN mkdir /home/user/.ionic && chown user:user /home/user/.ionic && chmod 777 /home/user/.ionic && \
	# this is necessary to install global npm modules
	chmod 777 /usr/local/bin && \
	chmod 777 /usr/local/lib/node_modules -R && \
	mkdir /home/user/build && chown -R user:user /home/user/build/ && chmod 777 /home/user/build && \
	mkdir /home/user/volume && chown -R user:user /home/user/volume/ && chmod 777 /home/user/volume

# add android stuff
# System libs for android enviroment 
RUN echo ANDROID_HOME="${ANDROID_HOME}" >> /etc/environment && \ 
	dpkg --add-architecture i386

RUN apt-get update && apt-get install -y  --no-install-recommends \
	expect \
	ant \
	libc6-i386 \
	lib32stdc++6 \
	lib32gcc1 \
	lib32z1 \
	lib32z1-dev \
	lib32ncurses-dev \
	qemu-kvm \
	kmod

RUN apt-get clean && apt-get autoclean

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Android Tools 
RUN mkdir /opt/android-sdk-linux && cd /opt/android-sdk-linux && \ 
	wget --output-document=android-tools-sdk.zip --quiet https://dl.google.com/android/repository/sdk-tools-"${SDK_TOOLS}".zip && \ 
	unzip -q android-tools-sdk.zip && \ 
	rm -f android-tools-sdk.zip

# Install Gradle 
RUN mkdir /opt/gradle && cd /opt/gradle && \ 
	wget --output-document=gradle.zip --quiet https://services.gradle.org/distributions/gradle-"${GRADLE_VERSION}"-all.zip && \ 
	unzip -q gradle.zip && \ 
	rm -f gradle.zip && \ 
	cd /opt/gradle/ && \
	chown -R user /opt

# Setup environment
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:/opt/gradle/gradle-${GRADLE_VERSION}/bin 

# Install Android SDK 
RUN yes | ${ANDROID_HOME}/tools/bin/sdkmanager --update && \
	yes | ${ANDROID_HOME}/tools/bin/sdkmanager "build-tools;${BUILDTOOLS_VERSION}" "platforms;${PLATFORM_VERSION}" "platform-tools"
RUN cordova telemetry off

# fix autorefresh bug on mounted volumes in windows hosts
# https://github.com/ionic-team/ionic-app-scripts/issues/1239#issuecomment-38741826
RUN touch /bashrc && \
	echo "alias win-ionic='CHOKIDAR_USEPOLLING=1 ionic'" >> /bashrc && \
	cp /bashrc /root/.bashrc && \
	cp /bashrc /home/user/.bashrc

WORKDIR /home/user/volume

# login as user, because npm has issues when running as root, e.g. when starting new projects: ionic start helloWorld blank
#USER user

# TODO: this is not yet solved on windows host:
# https://github.com/sass/node-sass/issues/2562