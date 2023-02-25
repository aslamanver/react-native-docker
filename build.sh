#!/bin/bash

# docker system prune -a
docker rmi --force $(docker images -q 'react-native' | uniq)
docker rm react_native_app

docker build -t react-native:1.0.1 .
docker run -it --name react_native_app react-native:1.0.1

# docker tag react-native:1.0.1 aslamanver/react-native:1.0.1
# docker push aslamanver/react-native:1.0.1