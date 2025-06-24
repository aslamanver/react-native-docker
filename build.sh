#!/bin/bash

# docker system prune -a
docker rmi --force $(docker images -q 'react-native' | uniq)
docker rm react_native_app

docker buildx build --platform linux/amd64 -t react-native:1.0.4 .
docker run -it --name react_native_app react-native:1.0.4

# docker tag react-native:1.0.4 aslamanver/react-native:1.0.4
# docker push aslamanver/react-native:1.0.4