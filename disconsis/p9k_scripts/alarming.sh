#!/bin/bash

glyph_color=$1
text_color=$2

get_alarm_time() {
    cat /tmp/alarm
}

pgrep -f $HOME/bin/alarm > /dev/null
# echo -n $glyph_color
# echo -n $text_color
if [[ $? == 0 ]]; then
    echo -n "%{%F{$glyph_color}%}  %{%f%}%{%F{$text_color}%}`get_alarm_time`%{%f%}"
fi
