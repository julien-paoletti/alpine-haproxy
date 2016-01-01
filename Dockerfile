FROM alpine:latest

MAINTAINER Julien Paoletti <julien.paoletti@gmail.com>

# installs HAProxy binaries
RUN apk update && apk add haproxy && rm /var/cache/apk/*

# adds HAProxy configuration file
COPY haproxy.cfg /etc/haproxy/

# adds HTTPS mandatory certificate file
COPY key.pem /etc/ssl/web/

# launches haproxy
CMD ["haproxy", "-d", "-f", "/etc/haproxy/haproxy.cfg"]
