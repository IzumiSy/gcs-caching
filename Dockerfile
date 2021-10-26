FROM google/cloud-sdk:alpine

RUN apt-get update
RUN apt-get install gzip -y
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

ENTRYPOINT ["/usr/src/app/main.sh"]
