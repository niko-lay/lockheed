#!/usr/bin/env bash

set -e
set -u

MUTE_HOUR_START=${1:-22}
MUTE_HOUR_END=${2:-9}

# date

cur_hour=$(date +%_H)
if (( ${cur_hour} > ${MUTE_HOUR_START} || ${cur_hour} < ${MUTE_HOUR_END} ));
then
    pactl set-sink-mute @DEFAULT_SINK@ true
    echo Sink muted
else
    echo No time for mute
fi
