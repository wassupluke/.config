#!/bin/bash
@import "~/.config/rofi/colors/myDarkLenovoTheme"
# options to be displayed
option0="🚪 	Logout"
option1="⏾	Suspend"
option2="🔄	Reboot"
option3="⏻	Shutdown"

uptime="`uptime -p | sed -e 's/up //g'`"

# options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4"

chosen="$(echo -e "$options" | rofi -dmenu -p "Uptime: $uptime" -theme-str '#window {width: 25%;} #listview {lines: 4;}')"
case $chosen in
	$option0)
		swaymsg exit;;
	$option1)
		exec systemctl suspend;;
	$option2)
		exec reboot;;
	$option3)
		exec systemctl poweroff;;
esac
