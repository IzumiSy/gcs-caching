FROM google/cloud-sdk:alpine

RUN apk --update --no-cache add gzip
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

ENTRYPOINT ["/usr/src/app/main.sh"]
