#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bars
echo "---" | tee -a /tmp/polybarleft.log /tmp/polybarcenter.log /tmp/polybarright.log
polybar left 2>&1 | tee -a /tmp/polybarleft.log & disown
polybar center 2>&1 | tee -a /tmp/polybarcenter.log & disown
polybar right 2>&1 | tee -a /tmp/polybarright.log & disown

echo "3.. 2.. 1.. Bars Launched!"
