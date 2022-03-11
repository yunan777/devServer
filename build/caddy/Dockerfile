FROM caddy:builder AS builder

ENV GOPROXY=https://mirrors.aliyun.com/goproxy/

RUN xcaddy build --with github.com/caddy-dns/alidns

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
