# stop running polybar instances
pkill polybar
while pgrep -u `id --user` -x polybar; do sleep 1; done

# starts bars
for monitor in `polybar -m | cut -d ":" -f 1`; do
    MONITOR="$monitor" polybar main &
done
