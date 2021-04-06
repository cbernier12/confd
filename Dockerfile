FROM nginx:mainline-alpine


ENV CONFD_VERSION="0.16.0" \
    CONFD_URL="https://github.com/kelseyhightower/confd/releases/download"

RUN apk --no-cache --update add ca-certificates openssl \
 && wget -T 5 ${CONFD_URL}/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -O /bin/confd \
 && chmod +x /bin/confd \
 && apk del ca-certificates openssl

WORKDIR /root
COPY .bashrc .
WORKDIR /

EXPOSE 2379

CMD ["nginx", "-g", "daemon off;"]


