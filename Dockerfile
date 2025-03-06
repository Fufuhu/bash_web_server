FROM --platform=amd64 debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    netcat-openbsd \
    curl \
    jq \
    && apt-get clean
EXPOSE 8080
COPY ./src/webserver.sh /usr/local/bin/webserver.sh
CMD [ "webserver.sh" ]