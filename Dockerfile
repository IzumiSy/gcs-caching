FROM google/cloud-sdk:slim

RUN apt-get update
RUN apt-get install gzip -y

WORKDIR /usr/src/app

COPY . .

ENTRYPOINT ["./main.sh"]
