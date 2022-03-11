FROM caddy:builder AS builder

ARG GOPROXY=direct

RUN xcaddy build --with github.com/caddy-dns/alidns

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
