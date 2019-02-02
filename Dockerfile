FROM node:alpine
RUN apk add --no-cache bash

RUN npm install -g npm
RUN npm install -g yarn

EXPOSE 3000

COPY ./react-native-multi-platform /app
WORKDIR /app

RUN yarn
RUN yarn build-ts

CMD ['yarn', 'web']