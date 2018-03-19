killall -q polybar

#Wait for shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#launch bars on all monitors
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

echo "Bars launched."
