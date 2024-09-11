FROM docker.io/library/alpine:latest AS extract

ADD https://github.com/victronenergy/gui-v2/releases/download/v0.3.10/venus-webassembly.zip /
RUN unzip venus-webassembly.zip
RUN sed -i "s/document\.location\.host + '/'192.168.32.26:9001/" wasm/index.html

FROM docker.io/library/nginx:1.27.1

COPY --from=extract /wasm /usr/share/nginx/html/
