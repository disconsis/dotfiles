#!/usr/bin/bash -x

# stop running polybar instances
pkill polybar
while pgrep -u `id --user` -x polybar; do sleep 1; done

# which bar
if pgrep xmonad; then
    bar=xmonad
else
    bar=main
fi

# starts bars
for monitor in `polybar -m | cut -d ":" -f 1`; do
    echo "$monitor"
    MONITOR="$monitor" polybar $bar &
done
