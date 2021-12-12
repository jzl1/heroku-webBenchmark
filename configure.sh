#!/bin/sh
/app/nezha -s $tz_address -p $tz_secret --skip-conn --skip-procs &
/app/alwayson.sh &
/app/bench -c $threads -s $URL 
