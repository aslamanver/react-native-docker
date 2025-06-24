FROM ubuntu:22.04

RUN apt-get update &&  \
    apt-get install curl -y && \
    apt-get install unzip -y && \
    apt-get install git -y && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt install -y openjdk-18-jdk -y && \
    apt-get clean

ADD Android.tar.xz /
ADD .gradle.tar.xz /root/

ENV JAVA_HOME /usr/lib/jvm/java-18-openjdk-amd64/
ENV ANDROID_HOME /Android/Sdk
ENV PATH="${PATH}:${ANDROID_HOME}/emulator"
ENV PATH="${PATH}:${ANDROID_HOME}/platform-tools"

# ADD citest /citest
# ADD entrypoint.sh /
# RUN chmod +x /entrypoint.sh
# CMD ["./entrypoint.sh"]

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "entrypoint.sh" ]
# CMD [ "node" ]

# OFFLINE

# FROM ubuntu:22.04

# # RUN apt-get update &&  \
# #     apt-get install curl -y && \
# #     apt-get install nodejs -y && \
# #     apt-get install npm -y && \
# #     apt install -y openjdk-18-jdk -y && \
# #     apt-get clean
# # ENV JAVA_HOME /usr/lib/jvm/java-18-openjdk-amd64/
# # RUN export JAVA_HOME

# ADD jdk-11 /jdk-11
# ENV JAVA_HOME /jdk-11
# RUN export JAVA_HOME
# ENV PATH="${PATH}:${JAVA_HOME}/bin"

# ADD Android /Android
# ENV ANDROID_HOME /Android/Sdk
# RUN export ANDROID_HOME
# ENV PATH="${PATH}:${ANDROID_HOME}/emulator"
# ENV PATH="${PATH}:${ANDROID_HOME}/platform-tools"

# ADD node-v18 /node-v18
# ENV NODE_HOME /node-v18
# RUN export NODE_HOME
# ENV PATH="${PATH}:${NODE_HOME}/bin"

# ADD .gradle ~/.gradle

# ADD citest /citest
# ADD entrypoint.sh /
# RUN chmod +x /entrypoint.sh
# CMD ["./entrypoint.sh"]
