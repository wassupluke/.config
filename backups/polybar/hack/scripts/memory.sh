#!/bin/sh
case "$1" in
    --popup)
        notify-send "Ram (%)" "$(ps axch -o cmd:10,pmem k -pmem | head | awk '$0=$0"%"' )"
        ;;
    *)
        echo " $(free -h --si | awk '/^Ram:/ {print $3 "/" $2}')"
        ;;
esac
