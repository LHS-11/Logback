name: CI-CD

on:
  push:
    branches:
      - master

env:
  RESOURCE_PATH: ./src/main/resources/application.yml

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Set up JDK 11
        uses: actions/setup-java@v1
        with:
          java-version: 11

      - name: Set yaml file
        uses: microsoft/variable-substitution@v1
        with:
          files: ${{ env.RESOURCE_PATH }}
        env:
          override.value: Chris Paul