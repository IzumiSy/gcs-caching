FROM google/cloud-sdk:alpine

RUN apk --update --no-cache add gzip

WORKDIR /usr/src/app

COPY . .

ENTRYPOINT ["/usr/src/app/main.sh"]
