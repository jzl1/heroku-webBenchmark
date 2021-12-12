#!/bin/sh
mkdir /app

wget -O /app/nezha "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/nezha-agent"
wget -O /app/alwayson.sh "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/alwayson.sh"
wget -O /app/bench "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/webBenchmark_linux_x64"
wget -O /app/Caddyfile "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/Caddyfile"

echo "deb [trusted=yes] https://apt.fury.io/caddy/ /" \
    | sudo tee -a /etc/apt/sources.list.d/caddy-fury.list
apt update
apt install caddy

chmod +x /app/*
nohup /app/nezha -s $tz_address -p $tz_secret --skip-conn --skip-procs &&
nohup caddy run -config /app/Caddyfile &&
nohup /app/alwayson.sh &&
/app/bench -c $threads -r $referer -s $URL 
