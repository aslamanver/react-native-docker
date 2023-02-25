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
