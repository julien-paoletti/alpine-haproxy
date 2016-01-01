# alpine-haproxy
HAProxy docker container based on alpine operating system. This is intended as a reverse proxy with SSL Termination.

# Generate a SSL certificate for HAProxy

First you need 2 files:
* a .crt one
* a .key one

You can obtain those two files by generating a self-signed certificate or from a certification authority.

Warning: the private key must not be encrypted to be used by HAProxy.

Next, merge the two files into a *.pem* one that will be used by HAProxy to serve HTTPS content:

```shell
cat ssl.crt ssl.key | tee key.pem
```
(replace *ssl.crt* and *ssl.key* by the names of your own files)

# Build container image

```shell
docker build -t jpao/haproxy:latest .
```

# Start container

```shell
docker run -d -p 80:80 -p 443:443 --name reverse-proxy jpao/haproxy:latest
docker logs reverse-proxy
```

# Stop container

```shell
docker stop reverse-proxy
```
