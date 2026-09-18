FROM node:alpine3.22

WORKDIR /tmp

COPY _index.js index.html package.json ./

EXPOSE 8080/tcp

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x _index.js &&\
    npm install

CMD ["node", "_index.js"]
