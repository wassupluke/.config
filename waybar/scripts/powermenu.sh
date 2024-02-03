#!/bin/bash
@import "~/.config/rofi/colors/myDarkLenovoTheme"
# options to be displayed
option0="🔓	Lock"
option1="🚪 	Logout"
option2="⏾	Suspend"
option3="🔄	Reboot"
option4="⏻	Shutdown"

uptime="`uptime -p | sed -e 's/up //g' | sed -e 's/ day,/d/g' | sed -e 's/ hours,/h/g' | sed -e 's/ minutes/m/g'`"
host=`hostname`

# options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4"

chosen="$(echo -e "$options" | rofi -dmenu -p "Uptime: $uptime" -theme-str '#window {width: 25%;} #listview {lines: 5;}')"
case $chosen in
	$option0)
		exec i3lock-fancy-rapid 10 3;;
	$option1)
		swaymsg exit;;
	$option2)
		exec systemctl suspend;;
	$option3)
		exec systemctl reboot;;
	$option4)
		exec systemctl shutdown --poweroff;;
esac
