FROM node:12.14.1-alpine3.9

MAINTAINER Alexis de Talhouët <adetalhouet89@gmail.com>

RUN apk update && apk add git && \
    git clone -b v2.6.4 https://github.com/open5gs/open5gs.git 

WORKDIR /open5gs/webui

RUN npm install && \
    npm run build

CMD npm run start

EXPOSE 3000
