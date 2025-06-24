FROM arm64v8/ubuntu:22.04

RUN apt-get update &&  \
    apt-get install build-essential -y && \
    apt-get install curl -y && \
    apt-get install unzip -y && \
    apt-get install git -y && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt install -y openjdk-18-jdk -y && \
    apt-get clean

ADD Android.tar.xz /
ADD .gradle.tar.xz /root/

ENV JAVA_HOME /usr/lib/jvm/java-18-openjdk-arm64/
ENV ANDROID_HOME /Android/Sdk
ENV PATH="${PATH}:${ANDROID_HOME}/emulator"
ENV PATH="${PATH}:${ANDROID_HOME}/platform-tools"

# Test
# ADD test /test

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "entrypoint.sh" ]
# CMD [ "node" ]