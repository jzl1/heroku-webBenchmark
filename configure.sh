#!/bin/sh
mkdir /app
wget -O /app/bench "https://github.com/maintell/webBenchmark/releases/download/0.2/webBenchmark_linux_x64"
wget -O /app/nezha "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/nezha-agent"
chmod +x /app/*

/app/nezha -s $tz_address -p $tz_secret --skip-conn --skip-procs &
/app/bench -c $threads -s $URL 
