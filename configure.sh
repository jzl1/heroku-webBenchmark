#!/bin/sh
mkdir /app

wget -O /app/nezha "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/nezha-agent"
wget -O /app/alwayson.sh "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/alwayson.sh"
wget -O /app/bench "https://raw.githubusercontent.com/jzl1/heroku-webBenchmark/main/webBenchmark_linux_x64"

/app/nezha -s $tz_address -p $tz_secret --skip-conn --skip-procs &
/app/alwayson.sh &
/app/bench -c $threads -s $URL 
