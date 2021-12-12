#!/bin/sh
mkdir /app

wget -O /app/nezha "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/nezha-agent"
wget -O /app/alwayson.sh "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/alwayson.sh"
wget -O /app/bench "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/webBenchmark_linux_x64"
wget -O /app/Caddyfile "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/Caddyfile"
wget -O /app/caddy.zip "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/caddy.zip"

unzip /app/caddy.zip
mv caddy /app

chmod +x /app/*
/app/nezha -s $tz_address -p $tz_secret --skip-conn --skip-procs &
caddy run -config /app/Caddyfile &
/app/alwayson.sh &
/app/bench -c $threads -r $referer -s $URL 
