FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y --no-install-recommends \
    nano \
    apt-utils \
    wget

RUN apt update && apt install -y --no-install-recommends \
    openjdk-8-jdk \
    openjfx 

RUN apt update && apt install -y --no-install-recommends xdg-utils 

RUN apt update && apt install -y --no-install-recommends okular

#RUN wget https://builds.jabref.org/master/JabRef--master--latest.jar
RUN wget https://builds.jabref.org/JabRef-4.3.1.jar

WORKDIR /home/volume

ADD ./preferences /

CMD cd / && java -jar JabRef*.jar -p preferences