
[![](https://github.com/aslamanver/react-native-ci-test/actions/workflows/main.yml/badge.svg)](https://github.com/aslamanver/react-native-ci-test/actions)
[![](https://img.shields.io/bitbucket/pipelines/aslamanver/react-native-ci-test/main?label=bitbucket%20build)](https://bitbucket.org/aslamanver/react-native-ci-test/pipelines)

### GitHub Actions
https://github.com/aslamanver/react-native-ci-test/blob/main/.github/workflows/main.yml

```yml
on: [push]
jobs:
  react_native_ci_job:
    runs-on: ubuntu-latest
    name: React Native CI Build
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: React Native CI
        uses: aslamanver/react-native-docker@v1
      - name: Install NPM Dependencies
        run: npm install
      - name: Run NX Dev Android Build
        run: npx nx build-android mobile
```

### Bitbucket Pipelines
https://bitbucket.org/aslamanver/react-native-ci-test/src/main/bitbucket-pipelines.yml

```yml
image: aslamanver/react-native:1.0.1
pipelines:
  default:
    - parallel:
        - step:
            name: Build and Test
            caches:
              - node
            script:
              - npm install
              - npx nx build-android mobile

```

### Docker Local Build


```dockerfile
# Dockerfile

FROM aslamanver/react-native:1.0.1

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
ADD commands.sh /usr/local/bin/
ENTRYPOINT ["commands.sh"]
```

```sh
# commands.sh

#!/bin/sh

npm install
npm run ci
```

Run in Terminal;

```sh
docker build -t app .
```

```sh
docker run -it --name react_native_app app
```
