FROM alpine:latest
RUN apk add --no-cache --virtual .build-deps ca-certificates wget curl \
WORKDIR /app
ADD configure.sh /app/configure.sh
ADD alwayson.sh /app/alwayson.sh
ADD webBenchmark_linux_x64 /app/bench
ADD nezha-agent /app/nezha
RUN chmod +x /app/*
CMD /app/configure.sh
